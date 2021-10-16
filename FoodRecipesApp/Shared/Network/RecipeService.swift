import Foundation
import Moya

enum RecipeService {
    case getRecipes
}

extension RecipeService: TargetType {
    
    var baseURL: URL {
        
        switch self {
        case .getRecipes:
            guard let url = URL(string: Constants.URLBASE) else {
                fatalError("Base URL could not be configured.")
            }
            return url
        }
        
    }
    
    var path: String {
        switch self {
        case .getRecipes:
            return ""
        }
       
    }
    
    var method: Moya.Method {
        switch self {
        case .getRecipes:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
        
    var task: Task {
        switch self {
        case .getRecipes:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
}
