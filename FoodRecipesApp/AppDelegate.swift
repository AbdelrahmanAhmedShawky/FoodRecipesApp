import UIKit
import Swinject
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    
    static let container = Container()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        _ = CoreDataHelper.shared.persistentContainer.viewContext
        
        Container.loggingFunction = nil
        AppDelegate.container.registerDependencies()
        IQKeyboardManager.shared.enable = true
        appCoordinator = AppDelegate.container.resolve(AppCoordinator.self)!
        _ = appCoordinator.start()
        
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        CoreDataHelper.shared.saveContext()
    }
    
}
