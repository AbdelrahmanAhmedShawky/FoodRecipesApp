import Foundation
import CoreData

protocol DatabaseManagerProtocol {
    func fetchFavoritesListList() -> [RecipeItemModel]
    func addFavoritesItem(item: RecipeItemModel?)
    func deleteFavoritesItem(item: RecipeItemModel?)
    func getItemFavorites(item: RecipeItemModel?) -> Bool?
}

extension DatabaseManagerProtocol {
    func fetchFavoritesListList() -> [RecipeItemModel] {
        fetchFavoritesListList()
    }
}

class DatabaseManager {
    static let shared: DatabaseManagerProtocol = DatabaseManager()
    
    var dbHelper: CoreDataHelper = CoreDataHelper.shared
        
    private func getItem(for todo: RecipeItemModel) -> TodoMO? {
        let predicate =  NSPredicate(format: "id == %@", todo.id ?? "")
        let result = dbHelper.fetchFirst(TodoMO.self, predicate: predicate)
        switch result {
        case .success(let todoMO):
            return todoMO
        case .failure(_):
            return nil
        }
    }
}

// MARK: - DataManagerProtocol
extension DatabaseManager: DatabaseManagerProtocol {
        
    func deleteFavoritesItem(item: RecipeItemModel?) {
        guard let item = item ,let todoMO = getItem(for: item) else {
            return
        }
        dbHelper.delete(todoMO)
    }
    
    func getItemFavorites(item: RecipeItemModel?) -> Bool? {
        
        guard let item = item ,let todoMO = getItem(for: item) else {
            return false
        }
        return true
    }
    
    func addFavoritesItem(item: RecipeItemModel?) {
        let entity = TodoMO.entity()
        let newTodo = TodoMO(entity: entity, insertInto: dbHelper.context)
        guard let item = item else {
            return
        }
        
        newTodo.id = item.id
        newTodo.fats = item.fats
        newTodo.name = item.name
        newTodo.time = item.time
        newTodo.image = item.image
        newTodo.carbos = item.carbos
        newTodo.fibers = item.fibers
        newTodo.rating = item.rating ?? 0.0
        newTodo.country = item.country
        newTodo.calories = item.calories
        newTodo.headline = item.headline
        newTodo.proteins = item.proteins
        newTodo.favorites = item.favorites ?? 0
        newTodo.difficulty = item.difficulty ?? 0
        newTodo.descriptions = item.descriptions
        newTodo.highlighted = item.highlighted ?? false
        newTodo.ingredients = item.ingredients
        newTodo.incompatibilities = item.incompatibilities
        newTodo.deliverableIngredients = item.deliverableIngredients
        
        dbHelper.create(newTodo)
    }
    
    func fetchFavoritesListList() -> [RecipeItemModel] {
        let result: Result<[TodoMO], Error> = dbHelper.fetch(TodoMO.self)
        switch result {
        case .success(let todoMOs):
            return todoMOs.map { $0.convertToTodo() }
        case .failure(let error):
            fatalError(error.localizedDescription)
        }
    }
    
}
