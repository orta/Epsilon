
import UIKit
import HockeySDK_Source

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func applicationDidBecomeActive(application: UIApplication) {
        let manager = BITHockeyManager.sharedHockeyManager()
        manager.configureWithIdentifier("a30a6c60246aad225b59a4ea75e91a2b")
        manager.startManager()
    }
}

