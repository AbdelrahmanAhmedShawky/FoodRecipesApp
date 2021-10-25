import Foundation
import RxSwift
import Moya
import Alamofire

protocol Networkable {
    func request<T: Codable>(endPoint: RecipeService) -> Observable<T>
}

struct NetworkManager: Networkable {
    
   private let provider = MoyaProvider<RecipeService>()
        
    func request<T: Codable>(endPoint: RecipeService) -> Observable<T> {
        
        return .create { observer in
            self.provider
                .rx
                .request(endPoint)
                .filterSuccessfulStatusAndRedirectCodes()
                .subscribe { event in
                    switch event {
                    case .success(let response):
                            if let response = try? JSONDecoder().decode(T.self, from: response.data) {
                                observer.onNext(response)
                                } else {
                                    observer.onError(NSError())
                                }
                        observer.onCompleted()
                    case .failure(let error):
                        guard let isReachable = NetworkReachabilityManager()?.isReachable,isReachable  else {
                            observer.onError(error)
                            return
                        }
                        observer.onError(error)

                    }
            }
        }
    }
}
