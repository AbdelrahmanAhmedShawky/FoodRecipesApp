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
        viewController.navigationItem.hidesBackButton = true
        
        viewController.viewModel = viewModel
        viewModel.itemSelected
            .subscribe(onNext: { results in
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
                
                guard let viewController = viewController  else {
                    return
                }
                viewController.viewModel = DetailsViewModel(recipeItem: results)
                self.navigationController.pushViewController(viewController, animated: true)
            }).disposed(by: disposeBag)
        
        return viewController
        
    }
}
