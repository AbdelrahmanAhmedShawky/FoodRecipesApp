import Foundation

struct RecipeItemModel : Codable {
    
	let id : String?
	let fats : String?
	let name : String?
	let time : String?
	let image : String?
	let weeks : [String]?
	let carbos : String?
	let fibers : String?
	let rating : String?
	let country : String?
	let ratings : String?
	let calories : String?
	let headline : String?
	let keywordswords : [String]?
	let products : [String]?
	let proteins : String?
	let favorites : Int?
	let difficulty : Int?
	let description : String?
	let highlighted : Bool?
	let ingredients : [String]?
	let incompatibilities : String?
	let deliverable_ingredients : [String]?
	let undeliverable_ingredients : [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case fats = "fats"
		case name = "name"
		case time = "time"
		case image = "image"
		case weeks = "weeks"
		case carbos = "carbos"
		case fibers = "fibers"
		case rating = "rating"
		case country = "country"
		case ratings = "ratings"
		case calories = "calories"
		case headline = "headline"
		case keywordswords = "keywords"
		case products = "products"
		case proteins = "proteins"
		case favorites = "favorites"
		case difficulty = "difficulty"
		case description = "description"
		case highlighted = "highlighted"
		case ingredients = "ingredients"
		case incompatibilities = "incompatibilities"
		case deliverable_ingredients = "deliverable_ingredients"
		case undeliverable_ingredients = "undeliverable_ingredients"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		fats = try values.decodeIfPresent(String.self, forKey: .fats)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		time = try values.decodeIfPresent(String.self, forKey: .time)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		weeks = try values.decodeIfPresent([String].self, forKey: .weeks)
		carbos = try values.decodeIfPresent(String.self, forKey: .carbos)
		fibers = try values.decodeIfPresent(String.self, forKey: .fibers)
		rating = try values.decodeIfPresent(String.self, forKey: .rating)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		ratings = try values.decodeIfPresent(String.self, forKey: .ratings)
		calories = try values.decodeIfPresent(String.self, forKey: .calories)
		headline = try values.decodeIfPresent(String.self, forKey: .headline)
        keywordswords = try values.decodeIfPresent([String].self, forKey: .keywordswords)
		products = try values.decodeIfPresent([String].self, forKey: .products)
		proteins = try values.decodeIfPresent(String.self, forKey: .proteins)
		favorites = try values.decodeIfPresent(Int.self, forKey: .favorites)
		difficulty = try values.decodeIfPresent(Int.self, forKey: .difficulty)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		highlighted = try values.decodeIfPresent(Bool.self, forKey: .highlighted)
		ingredients = try values.decodeIfPresent([String].self, forKey: .ingredients)
		incompatibilities = try values.decodeIfPresent(String.self, forKey: .incompatibilities)
		deliverable_ingredients = try values.decodeIfPresent([String].self, forKey: .deliverable_ingredients)
		undeliverable_ingredients = try values.decodeIfPresent([String].self, forKey: .undeliverable_ingredients)
	}

}
