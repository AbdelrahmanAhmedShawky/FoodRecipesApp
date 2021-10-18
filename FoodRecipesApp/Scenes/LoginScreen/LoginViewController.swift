import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var viewModel: LoginViewModel?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Login Screen"
        setUpBindings()
    }
    
    private func setUpBindings() {
        guard let viewModel = viewModel  else {
            return
        }
        
        let outputs = viewModel.configure(
            input: LoginViewModel.Input(
                username: usernameTextField.rx.text.orEmpty.asObservable(),
                password: passwordTextField.rx.text.orEmpty.asObservable()))

        outputs.isLoginAllowed.drive(confirmButton.rx.isEnabled).disposed(by: disposeBag)

        confirmButton.rx.tap.throttle(.seconds(1), scheduler: MainScheduler.instance).bind {
            viewModel.confirmButtonAction.onNext(true)
        }.disposed(by: disposeBag)
    }
    
}
