extension TodoMO {
    func convertToTodo() -> RecipeItemModel {
        RecipeItemModel(
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
