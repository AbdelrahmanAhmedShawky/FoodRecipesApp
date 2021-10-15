import Swinject
import SwinjectAutoregistration

extension Container {
    func registerNetworkManger() {
        autoregister(NetworkManager.self, initializer: NetworkManager.init).inObjectScope(.container)
    }
}
