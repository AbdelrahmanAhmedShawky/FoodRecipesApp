import XCTest

class RecipeTest: XCTestCase {

    func testSuccessParser() {
        let json = """
        {
                "id": "533143aaff604d567f8b4571",
                "fats": "8 g",
                "name": "Crispy Fish Goujons ",
                "time": "PT35M",
                "image": "https://img.hellofresh.com/w_1080,f_webp,q_auto/hellofresh_s3/image/zartes-kokos-fischfilet-76aba609.jpg",
                "weeks": [
                    "2014-W20"
                ],
                "carbos": "47 g",
                "fibers": "",
                "rating": null,
                "country": "GB",
                "ratings": null,
                "calories": "516 kcal",
                "headline": "with Sweet Potato Wedges and Minted Snap Peas",
                "keywords": [
                    ""
                ],
                "products": [
                    "family-box"
                ],
                "proteins": "43 g",
                "favorites": 1,
                "difficulty": 0,
                "description": "There’s nothing like the simple things in life - the smell of freshly cut grass",
                "highlighted": true,
                "ingredients": [
                    "375g Sweet Potatoes",
                    "1 Tsp Paprika",
                    "2 Tbsps Parmesan Cheese",
                    "1 Lemon",
                    "A Few Sprigs Thyme",
                    "25g Panko Breadcrumbs",
                    "1 Tbsp Butter",
                    "2 Cod Fillets",
                    "150g Sugar Snap Peas",
                    "A Few Sprigs Mint",
                    "75ml Sour Cream"
                ],
                "incompatibilities": null,
                "deliverable_ingredients": [
                    "375g Sweet Potatoes",
                    "1 Tsp Paprika",
                    "2 Tbsps Parmesan Cheese",
                    "1 Lemon",
                    "A Few Sprigs Thyme",
                    "25g Panko Breadcrumbs",
                    "1 Tbsp Butter",
                    "2 Cod Fillets",
                    "150g Sugar Snap Peas",
                    "A Few Sprigs Mint",
                    "75ml Sour Cream"
                ],
                "undeliverable_ingredients": []
            }
        """.data(using: .utf8)!
        
        let recipe = try? JSONDecoder().decode(RecipeItemModel.self, from: json)
        
        XCTAssertNotNil(recipe)
        XCTAssertEqual(recipe?.id, RecipeItemModel.with().id)
    }

}
