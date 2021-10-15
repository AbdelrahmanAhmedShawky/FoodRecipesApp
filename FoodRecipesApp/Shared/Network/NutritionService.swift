import Foundation
import Moya

enum NutritionService {
    case getItemNutritionDetails(item:String)
}

extension NutritionService: TargetType {
    
    var baseURL: URL {
        
        switch self {
        case .getItemNutritionDetails(let item):
            guard let url = URL(string: Constants.URLBASE + Constants.endPoint + "&ingr=\(item)") else {
                fatalError("Base URL could not be configured.")
            }
            return url
        }
        
    }
    
    var path: String {
        switch self {
        case .getItemNutritionDetails:
            return ""
        }
       
    }
    
    var method: Moya.Method {
        switch self {
        case .getItemNutritionDetails:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
        
    var task: Task {
        switch self {
        case .getItemNutritionDetails:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
