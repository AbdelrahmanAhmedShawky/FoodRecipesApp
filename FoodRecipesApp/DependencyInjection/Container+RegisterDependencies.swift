import Swinject

extension Container {
    func registerDependencies() {
        registerCoordinators()
        registerViewModel()
        registerNetworkManger()
    }
}
