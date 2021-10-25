import Foundation

class MockDataManager {
    var todos = [RecipeItemModel]()
    var todosArray = [           RecipeItemModel(id: "12356", fats: "fat", name: "name",
                                                 time: "time", image: "image",
                                                 carbos: "carbos", fibers: "fibers",
                                                 rating: 2, country: "country",
                                                 calories: "calories", headline: "headline",
                                                 proteins: "proteins", favorites: 3,
                                                 difficulty: 4, descriptions: "descriptions",
                                                 highlighted: false, ingredients: ["ingredients"],
                                                 incompatibilities: "incompatibilities",
                                                 deliverableIngredients: ["deliverableIngredients"]),
                                 RecipeItemModel(id: "2223332443", fats: "fat", name: "name",
                                                 time: "time", image: "image",
                                                 carbos: "carbos", fibers: "fibers",
                                                 rating: 2, country: "country",
                                                 calories: "calories", headline: "headline",
                                                 proteins: "proteins", favorites: 3, difficulty: 4,
                                                 descriptions: "descriptions",
                                                 highlighted: false, ingredients: ["ingredients"],
                                                 incompatibilities: "incompatibilities",
                                                 deliverableIngredients: ["deliverableIngredients"])]
    init() {
        todos = [RecipeItemModel]()
    }
}

// MARK: - DataManagerProtocol
extension MockDataManager: DatabaseManagerProtocol {
    func addFavoritesItem(item: RecipeItemModel?) {
        
        guard let todo = item,!(todos.contains { $0.id == todo.id }) else {
            return
        }
        
        todos.append(todo)
  
    }
    
    func deleteFavoritesItem(item: RecipeItemModel?) {
        guard let todo = item ,let index = todos.firstIndex(where: { $0.id == todo.id })else {
            return
        }
        todos.remove(at: index)
    }
    
    func isFavoriteItem(item: RecipeItemModel?) -> Bool? {
        guard let todo = item ,let index = todos.firstIndex(where: { $0.id == todo.id }) else {
            return false
        }
        return true
    }
    
    func fetchFavoritesListList() -> [RecipeItemModel] {
        return todos
    }
    
}
