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

        self.navigationController.navigationBar.backgroundColor = UIColor(red: 100/255, green: 215/255, blue: 65/255, alpha: 1)
        self.navigationController.navigationItem.backBarButtonItem?.tintColor = UIColor.white
        self.navigationController.navigationBar.isTranslucent = true
        if var textAttributes = navigationController.navigationBar.titleTextAttributes {
            textAttributes[NSAttributedString.Key.foregroundColor] = UIColor.white
            navigationController.navigationBar.titleTextAttributes = textAttributes
        }
        self.navigationController.navigationBar.barTintColor = UIColor(red: 100/255, green: 215/255, blue: 65/255, alpha: 1)
        self.navigationController.navigationBar.barStyle = UIBarStyle.black
        self.navigationController.navigationBar.tintColor = UIColor.white
        
        viewModel.confirmButtonAction
            .subscribe(onNext: { _ in
                self.recipeListViewCoordinator = RecipeListViewCoordinator(viewModel: RecipeListViewModel(networkManager: NetworkManager()))
                
                guard let coordinator = self.recipeListViewCoordinator else {
                    return
                }
                
                let recipeListViewVC = self.start(coordinator:  coordinator)
                self.removeChildCoordinators()
//                rootViewController.modalPresentationStyle = .fullScreen
                self.recipeListViewCoordinator?.navigationController = self.navigationController
                self.navigationController.pushViewController(recipeListViewVC, animated: true)
//                appDelegate?.window?.rootViewController?.present(rootViewController, animated: true, completion: nil)
            }).disposed(by: disposeBag)
        
        navigationController.viewControllers = [viewController]
        appDelegate?.window?.rootViewController = navigationController
        return viewController
        
    }
}
