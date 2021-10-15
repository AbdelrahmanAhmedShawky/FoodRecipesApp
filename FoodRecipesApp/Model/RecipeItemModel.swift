import Foundation

struct RecipeItemModel : Codable {
    
	let id : String?
	let fats : String?
	let name : String?
	let time : String?
	let image : String?
	let carbos : String?
	let fibers : String?
	let rating : Double?
	let country : String?
	let calories : String?
	let headline : String?
	let proteins : String?
	let favorites : Int32?
	let difficulty : Int32?
	let descriptions : String?
	let highlighted : Bool?
	let ingredients : [String]?
	let incompatibilities : String?
	let deliverable_ingredients : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case fats = "fats"
		case name = "name"
		case time = "time"
		case image = "image"
		case carbos = "carbos"
		case fibers = "fibers"
		case rating = "rating"
		case country = "country"
		case calories = "calories"
		case headline = "headline"
		case proteins = "proteins"
		case favorites = "favorites"
		case difficulty = "difficulty"
		case descriptions = "description"
        case highlighted = "highlighted"
        case ingredients = "ingredients"
        case incompatibilities = "incompatibilities"
		case deliverable_ingredients = "deliverable_ingredients"
	}
    
}
