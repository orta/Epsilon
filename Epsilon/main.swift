import Foundation
import UIKit

// To have a custyom UIApplication we need to have our own main function

UIApplicationMain(
    Process.argc,
    Process.unsafeArgv,
    NSStringFromClass(TimeoutableApplication),
    NSStringFromClass(AppDelegate)
)
