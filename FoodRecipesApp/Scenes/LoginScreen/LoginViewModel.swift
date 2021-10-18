import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: UnidirectionalViewModelType {
  
    struct Input: InputType {
        let username: Observable<String>
        let password: Observable<String>
    }

    struct Output: OutputType {
        let isLoginAllowed: Driver<Bool>
    }

    var confirmButtonAction = PublishSubject<Bool>()
    
    func configure(input: Input) -> Output {
        let isLoginAllowed = Observable.combineLatest(input.username, input.password) { (username, password) in
            return !username.isEmpty && !password.isEmpty
        }.asDriver(onErrorJustReturn: false)
        return Output(isLoginAllowed: isLoginAllowed)
    }
}
