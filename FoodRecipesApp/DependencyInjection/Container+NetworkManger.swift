import Swinject
import SwinjectAutoregistration

extension Container {
    func registerNetworkManger() {
        autoregister(Networkable.self, initializer: NetworkManager.init as () -> NetworkManager).inObjectScope(.container)
    }
}
