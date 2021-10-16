import Foundation

extension RecipeItemModel {
    
    static func with(id: String = "533143aaff604d567f8b4571",
                     fats: String = "Swift MVVM",
                     name: String = "Swift MVVM",
                     time: String = "Swift MVVM",
                     image:String = "Swift MVVM",
                     carbos: String = "Swift MVVM",
                     fibers: String = "Swift MVVM",
                     rating: Double = 4,
                     country:String = "Swift MVVM",
                     calories:String = "Swift MVVM",
                     headline:String = "Swift MVVM",
                     proteins:String = "Swift MVVM",
                     favorites: Int32 = 4,
                     difficulty: Int32 = 4,
                     descriptions:String = "Swift MVVM",
                     highlighted: Bool = false,
                     ingredients:[String] = ["Swift MVVM"],
                     incompatibilities:String = "Swift MVVM",
                     deliverableIngredients:[String] = ["Swift MVVM"]) -> RecipeItemModel {
        return RecipeItemModel(
            id:id,
            fats: fats,
            name: name,
            time: time,
            image:image,
            carbos: carbos,
            fibers: fibers,
            rating: rating,
            country:country,
            calories:calories,
            headline:headline,
            proteins:proteins,
            favorites:favorites,
            difficulty:difficulty,
            descriptions:descriptions,
            highlighted:highlighted,
            ingredients:ingredients,
            incompatibilities:incompatibilities,
            deliverableIngredients:deliverableIngredients
        )
    }
    
}
