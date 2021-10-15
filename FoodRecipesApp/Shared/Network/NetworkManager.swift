import Foundation
import RxSwift
import Moya
import Alamofire

protocol Networkable {
    func request<T: Codable>(endPoint: NutritionService) -> Observable<T>
}


struct NetworkManager: Networkable {
    
   private let provider = MoyaProvider<NutritionService>()
        
    func request<T: Codable>(endPoint: NutritionService) -> Observable<T> {
        
        return .create { observer in
            self.provider
                .rx
                .request(endPoint)
                .filterSuccessfulStatusAndRedirectCodes()
                .subscribe { event in
                    switch event {
                    case .success(let response):
                        print(response.data)
                            if let response = try? JSONDecoder().decode(T.self, from: response.data) {
                                observer.onNext(response)
                                } else {
                                    observer.onError(NSError())
                                }
                            observer.onCompleted()
                        
                    case .error(let error):
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
