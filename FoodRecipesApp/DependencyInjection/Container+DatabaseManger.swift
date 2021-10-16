import Swinject
import SwinjectAutoregistration

extension Container {
    func registerDatabaseManger() {
        autoregister(DatabaseManager.self, initializer: DatabaseManager.init).inObjectScope(.container)
        autoregister(CoreDataHelper.self, initializer: CoreDataHelper.init).inObjectScope(.container)
    }
}
