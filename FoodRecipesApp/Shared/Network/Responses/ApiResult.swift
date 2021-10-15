import Foundation
import RxCocoa
import RxSwift

enum ApiResult<T> {
    
    case success(data: T?)
    case failure(error: NSError)
}
