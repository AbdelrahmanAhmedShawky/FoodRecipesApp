import Foundation
import UIKit
import RxSwift
import RxCocoa

class LoginViewCoordinator: BaseCoordinator {
    
    let disposeBag = DisposeBag()
    private var viewModel: LoginViewModel
    var recipeListViewCoordinator : RecipeListViewCoordinator?
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        
    }
    
    override func start() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let recipeListViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        guard let viewController = recipeListViewController  else {
            return UIViewController()
        }
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        viewController.viewModel = viewModel
        
        if var textAttributes = navigationController.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.white
            navigationController.navigationBar.titleTextAttributes = textAttributes
        }

        viewModel.confirmButtonAction
            .subscribe(onNext: { _ in
                self.recipeListViewCoordinator = RecipeListViewCoordinator(viewModel: RecipeListViewModel(networkManager: NetworkManager()))
                
                guard let coordinator = self.recipeListViewCoordinator else {
                    return
                }
                
                let recipeListViewVC = self.start(coordinator:  coordinator)
                self.removeChildCoordinators()
                let rootViewController = UINavigationController(rootViewController: recipeListViewVC)
                rootViewController.navigationBar.backgroundColor = UIColor(red: 100/255, green: 215/255, blue: 65/255, alpha: 1)
                rootViewController.navigationItem.backBarButtonItem?.tintColor = UIColor.white
                rootViewController.navigationBar.isTranslucent = true
                if var textAttributes = rootViewController.navigationBar.titleTextAttributes {
                    textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.white
                    rootViewController.navigationBar.titleTextAttributes = textAttributes
                }
                rootViewController.navigationBar.barTintColor = UIColor(red: 100/255, green: 215/255, blue: 65/255, alpha: 1)
                rootViewController.navigationBar.barStyle = UIBarStyle.black
                rootViewController.navigationBar.tintColor = UIColor.white
                rootViewController.modalPresentationStyle = .fullScreen
//                recipeListViewVC.navigationController = self.navigationController
                appDelegate?.window?.rootViewController?.present(rootViewController, animated: true, completion: nil)
            }).disposed(by: disposeBag)
        
        appDelegate?.window?.rootViewController = viewController
        return viewController
        
    }
}
