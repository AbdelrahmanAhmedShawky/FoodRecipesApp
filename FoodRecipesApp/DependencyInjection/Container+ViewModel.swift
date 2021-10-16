import Swinject
import SwinjectAutoregistration

extension Container {
    
    func registerViewModel() {
        autoregister(RecipeListViewModel.self, initializer: RecipeListViewModel.init)
        autoregister(DetailsViewModel.self, initializer: DetailsViewModel.init)
    }
}
