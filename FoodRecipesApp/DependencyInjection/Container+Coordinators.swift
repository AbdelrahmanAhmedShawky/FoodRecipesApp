import Swinject
import SwinjectAutoregistration

extension Container {
    func registerCoordinators() {
        autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        autoregister(RecipeListViewCoordinator.self, initializer: RecipeListViewCoordinator.init)
    }
    
}
