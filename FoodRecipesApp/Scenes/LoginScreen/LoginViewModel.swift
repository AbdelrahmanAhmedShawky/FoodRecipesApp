import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: UnidirectionalViewModelType {
  
    struct Input: InputType {
        let email: Observable<String>
        let password: Observable<String>
    }

    struct Output: OutputType {
        let isLoginAllowed: Driver<Bool>
    }

    var confirmButtonAction = PublishSubject<Bool>()
    
    func configure(input: Input) -> Output {
        let isLoginAllowed = Observable.combineLatest(input.email, input.password) { (email, password) in
            return !email.isEmpty && !password.isEmpty && email.validateEmail()
        }.asDriver(onErrorJustReturn: false)
        return Output(isLoginAllowed: isLoginAllowed)
    }
}
