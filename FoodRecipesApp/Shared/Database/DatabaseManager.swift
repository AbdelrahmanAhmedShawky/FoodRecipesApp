import Foundation
import CoreData

protocol DatabaseManagerProtocol {
    func fetchFavoritesListList() -> [RecipeItemModel]
    func addFavoritesItem(id: String?, fats: String?, name:String?, time: String?, image: String?, carbos: String?, fibers: String?, rating: Double?, country: String?, calories: String?, headline: String?, proteins: String?, favorites: Int32?, difficulty: Int32?, descriptions:String?, highlighted: Bool?, ingredients: [String]?, incompatibilities: String?, deliverable_ingredients: [String]?)
    func deleteFavoritesItem(id: String?, fats: String?, name:String?, time: String?, image: String?, carbos: String?, fibers: String?, rating: Double?, country: String?, calories: String?, headline: String?, proteins: String?, favorites: Int32?, difficulty: Int32?, descriptions:String?, highlighted: Bool?, ingredients: [String]?, incompatibilities: String?, deliverable_ingredients: [String]?)
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
        
    func deleteFavoritesItem(id: String?, fats: String?, name:String?, time: String?, image: String?, carbos: String?, fibers: String?, rating: Double?, country: String?, calories: String?, headline: String?, proteins: String?, favorites: Int32?, difficulty: Int32?, descriptions:String?, highlighted: Bool?, ingredients: [String]?, incompatibilities: String?, deliverable_ingredients: [String]?) {
        guard let todoMO = getItem(for: RecipeItemModel(id: id, fats: fats, name: name, time: time, image: image, carbos: carbos, fibers: fibers, rating: rating, country: country, calories: calories, headline: headline, proteins: proteins, favorites: favorites, difficulty: difficulty, descriptions: descriptions, highlighted: highlighted, ingredients: ingredients, incompatibilities: incompatibilities, deliverable_ingredients: deliverable_ingredients)) else {
            return
        }
        dbHelper.delete(todoMO)
    }
    
    func addFavoritesItem(id: String?, fats: String?, name:String?, time: String?, image: String?, carbos: String?, fibers: String?, rating: Double?, country: String?, calories: String?, headline: String?, proteins: String?, favorites: Int32?, difficulty: Int32?, descriptions:String?, highlighted: Bool?, ingredients: [String]?, incompatibilities: String?, deliverable_ingredients: [String]?) {
        let entity = TodoMO.entity()
        let newTodo = TodoMO(entity: entity, insertInto: dbHelper.context)
        newTodo.id = id
        newTodo.fats = fats
        newTodo.name = name
        newTodo.time = time
        newTodo.image = image
        newTodo.carbos = carbos
        newTodo.fibers = fibers
        newTodo.rating = rating ?? 0.0
        newTodo.country = country
        newTodo.calories = calories
        newTodo.headline = headline
        newTodo.proteins = proteins
        newTodo.favorites = favorites ?? 0
        newTodo.difficulty = difficulty ?? 0
        newTodo.descriptions = descriptions
        newTodo.highlighted = highlighted ?? false
        newTodo.ingredients = ingredients
        newTodo.incompatibilities = incompatibilities
        newTodo.deliverable_ingredients = deliverable_ingredients
        
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
