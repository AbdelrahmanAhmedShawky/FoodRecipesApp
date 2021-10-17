import Foundation

class MockDataManager {
    private var todos = [RecipeItemModel]()
    
    init() {
//        todos = [
//            RecipeItemModel(id: "1", fats: "fat", name: "name",
//                            time: "time", image: "image",
//                            carbos: "carbos", fibers: "fibers",
//                            rating: 2, country: "country",
//                            calories: "calories", headline: "headline",
//                            proteins: "proteins", favorites: 3,
//                            difficulty: 4, descriptions: "descriptions",
//                            highlighted: false, ingredients: ["ingredients"],
//                            incompatibilities: "incompatibilities",
//                            deliverableIngredients: ["deliverableIngredients"]),
//            RecipeItemModel(id: "2", fats: "fat", name: "name",
//                            time: "time", image: "image",
//                            carbos: "carbos", fibers: "fibers",
//                            rating: 2, country: "country",
//                            calories: "calories", headline: "headline",
//                            proteins: "proteins", favorites: 3, difficulty: 4,
//                            descriptions: "descriptions",
//                            highlighted: false, ingredients: ["ingredients"],
//                            incompatibilities: "incompatibilities",
//                            deliverableIngredients: ["deliverableIngredients"])
//
//        ]
    }
}

// MARK: - DataManagerProtocol
extension MockDataManager: DatabaseManagerProtocol {
    func addFavoritesItem(item: RecipeItemModel?) {
        guard let todo = item else {
            return
        }
        todos.insert(todo, at: 0)
    }
    
    func deleteFavoritesItem(item: RecipeItemModel?) {
        guard let todo = item ,let index = todos.firstIndex(where: { $0.id == todo.id })else {
            return
        }
        todos.remove(at: index)
    }
    
    func getItemFavorites(item: RecipeItemModel?) -> Bool? {
        guard let todo = item ,let index = todos.firstIndex(where: { $0.id == todo.id })else {
            return false
        }
        return true
    }
    
}
