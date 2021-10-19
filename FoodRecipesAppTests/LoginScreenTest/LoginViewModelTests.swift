import Foundation
import RxSwift
import RxCocoa
import RxTest
import RxBlocking
import XCTest

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!

    let disposeBag = DisposeBag()
    
    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testThatEmptyCredentialsDisallowLogin() throws {
        let email = ""
        let password = ""
      let output = viewModel.configure(input: LoginViewModel.Input(
        email: Observable.just(email),
            password: Observable.just(password)))
        let isLoginAllow = output.isLoginAllowed
        XCTAssertFalse(try isLoginAllow.toBlocking().first() ?? false)
    }
    
    func testThatSetNotValidCredentialsThenNotAllowLogin() throws {
        let email = "test"
        let password = "test"
      let output = viewModel.configure(input: LoginViewModel.Input(
        email: Observable.just(email),
            password: Observable.just(password)))
        let isLoginAllow = output.isLoginAllowed
        XCTAssertFalse(try isLoginAllow.toBlocking().first() ?? false)
    }
    
    func testThatSetCredentialsAllowLogin() throws {
        let email = "test@test.com"
        let password = "test"
      let output = viewModel.configure(input: LoginViewModel.Input(
        email: Observable.just(email),
            password: Observable.just(password)))
        let isLoginAllow = output.isLoginAllowed
        XCTAssertTrue(try isLoginAllow.toBlocking().first() ?? false)
    }
}
