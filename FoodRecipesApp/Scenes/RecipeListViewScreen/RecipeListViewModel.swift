import Foundation
import RxSwift
import RxCocoa

class RecipeListViewModel {
    
    private let disposeBag = DisposeBag()
    let networkManager : NetworkManager
    var result = BehaviorRelay<[RecipeItemModel]>(value: ([]))
    let error = PublishRelay<String?>()
    var itemSelected = PublishSubject<RecipeItemModel>()

    
    init(networkManager : NetworkManager) {
        self.networkManager = networkManager
        self.fetchData()
    }
    
    private func fetchApi() -> Observable<[RecipeItemModel]?> {
        return self.networkManager.request(endPoint: .getRecipes)
    }
    
    func fetchData() {
        self.fetchApi().subscribe { [weak self] result in
            if let items = result {
                self?.result.accept(items)
            }
        } onError: { [weak self] error in
            self?.error.accept(error.localizedDescription)
        }.disposed(by: disposeBag)

    }
    
}
