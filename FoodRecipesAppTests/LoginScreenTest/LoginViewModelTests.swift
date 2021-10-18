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

import XCTest

class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testThatEmptyCredentialsDisallowLogin() throws {
        let username = ""
        let password = ""
      let output = viewModel.configure(input: LoginViewModel.Input(
            username: Observable.just(username),
            password: Observable.just(password)))
        XCTAssertFalse(output.isLoginAllowed)
    }

    func testThatSetCredentialsAllowLogin() throws {
        let username = "test"
        let password = "test"
      let output = viewModel.configure(input: LoginViewModel.Input(
            username: Observable.just(username),
            password: Observable.just(password)))
        XCTAssertFalse(output.isLoginAllowed)
    }
}
