import Swinject
import SwinjectAutoregistration

extension Container {
    func registerNetworkManger() {
//        autoregister(NetworkManager.self, initializer: NetworkManager.init).inObjectScope(.container)
        autoregister(Networkable.self, initializer: NetworkManager.init as () -> NetworkManager).inObjectScope(.container)
    }
}
