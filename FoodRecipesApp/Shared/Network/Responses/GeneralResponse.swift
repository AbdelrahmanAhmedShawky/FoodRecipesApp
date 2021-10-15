import Foundation

struct GeneralResponse<T: Decodable>: Decodable {
    
    let results: T?
    let resultCount: Int?
    
}
