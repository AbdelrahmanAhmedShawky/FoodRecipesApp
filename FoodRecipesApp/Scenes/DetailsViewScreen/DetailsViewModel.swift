import Foundation
import RxSwift
import RxCocoa

protocol FavoritesListViewModelProtocol {
    func addFavoritesItem(item: RecipeItemModel?)
    func deleteFavoritesItem(item: RecipeItemModel?)
    func isFavoriteItem(item: RecipeItemModel?) -> Bool
    func fetchFavoritesListList() -> [RecipeItemModel]
}

class DetailsViewModel {

    var recipeItem : RecipeItemModel?
    
    var dataManager: DatabaseManagerProtocol
    let isFavorite = BehaviorRelay<Bool?>(value:false)
    
    init(recipeItem: RecipeItemModel?,dataManager: DatabaseManagerProtocol = DatabaseManager.shared) {
        self.recipeItem = recipeItem
        self.dataManager = dataManager
        isFavorite.accept(self.isFavoriteItem(item: recipeItem))
    }
    
}

extension DetailsViewModel: FavoritesListViewModelProtocol {
    func addFavoritesItem(item: RecipeItemModel?) {
        dataManager.addFavoritesItem(item: item)
        isFavorite.accept(self.isFavoriteItem(item: recipeItem))
    }
    
    func deleteFavoritesItem(item: RecipeItemModel?) {
        dataManager.deleteFavoritesItem(item: item)
        isFavorite.accept(self.isFavoriteItem(item: recipeItem))
    }
    
    func isFavoriteItem(item: RecipeItemModel?) -> Bool {
        return dataManager.isFavoriteItem(item: item) ?? false
    }
    
    func fetchFavoritesListList() -> [RecipeItemModel] {
        return dataManager.fetchFavoritesListList()
    }
    
}
