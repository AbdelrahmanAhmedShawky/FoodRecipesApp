//
//  LoginViewModelTests.swift
//  FoodRecipesAppTests
//
//  Created by Abdelrahman Shawky on 18/10/2021.
//

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
        let isLoginAllow = try! output.isLoginAllowed.toBlocking().first()!
        XCTAssertFalse(isLoginAllow)
    }
    
    func testThatSetNotValidCredentialsThenNotAllowLogin() throws {
        let email = "test"
        let password = "test"
      let output = viewModel.configure(input: LoginViewModel.Input(
        email: Observable.just(email),
            password: Observable.just(password)))
        let isLoginAllow = try! output.isLoginAllowed.toBlocking().first()!
        XCTAssertFalse(isLoginAllow)
    }
    
    func testThatSetCredentialsAllowLogin() throws {
        let email = "test@test.com"
        let password = "test"
      let output = viewModel.configure(input: LoginViewModel.Input(
        email: Observable.just(email),
            password: Observable.just(password)))
        let isLoginAllow = try! output.isLoginAllowed.toBlocking().first()!
        XCTAssertTrue(isLoginAllow)
    }
}
