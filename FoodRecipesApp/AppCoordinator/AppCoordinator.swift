import Foundation
import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator {

    let disposeBag = DisposeBag()
    
    init(navigationController: UINavigationController?) {
        navigationController?.navigationBar.backgroundColor = UIColor.white
    }
    
    override func start() -> UIViewController {
        return renderInitScreen()
    }
    
    private func renderInitScreen() -> UIViewController {
        
        guard let coordinator = AppDelegate.container.resolve(RecipeListViewCoordinator.self) else {
            return UIViewController()
        }
        
       return start(coordinator: coordinator)
        
    }
    
}
