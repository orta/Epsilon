
import UIKit

class TimeoutableApplication: UIApplication {

    let settings = WebViewSettings.loadFromDefaults()
    var timer:NSTimer?

    func sendReloadNotification() {
        NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        scheduleNew()
    }

    override func sendEvent(event: UIEvent) {
        super.sendEvent(event)
        scheduleNew()
    }

    func scheduleNew() {
        if let timer = timer {
            timer.invalidate()
        }
        let interval = Double(settings.minutesBeforeLogOut * 60)
        timer = NSTimer.scheduledTimerWithTimeInterval(interval , target: self, selector: Selector("sendReloadNotification"), userInfo: nil, repeats: false)
    }
}
