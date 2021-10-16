import Foundation
import UIKit
import RxSwift
import RxCocoa

class RecipeListViewCoordinator: BaseCoordinator {
    
    let disposeBag = DisposeBag()
    private var viewModel: RecipeListViewModel
    
    init(viewModel: RecipeListViewModel) {
        self.viewModel = viewModel
        
    }
    
    override func start() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let recipeListViewController = storyboard.instantiateViewController(withIdentifier: "RecipeListViewController") as? RecipeListViewController
        
        guard let viewController = recipeListViewController  else {
            return UIViewController()
        }
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        viewController.viewModel = viewModel
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
        
        
        navigationController.viewControllers = [viewController]
        appDelegate?.window?.rootViewController = navigationController
        return viewController
        
    }
}
