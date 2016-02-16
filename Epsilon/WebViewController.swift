import UIKit
import WebKit
import Cartography

class ARWebActionController: NSObject, WKNavigationDelegate {
    var settings = WebViewSettings.loadFromDefaults()
    var backButton: UIButton!

    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        backButton.hidden =  webView.backForwardList.backList.count > 1
    }

}

class ARBanZoomingScrollDelegate: NSObject, UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return nil
    }
}

class WebViewController: UIViewController {

    var webView = WKWebView()
    let actionController = ARWebActionController()
    let zoomBan = ARBanZoomingScrollDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView(frame: view.bounds)

        let initialRequest = NSURLRequest(URL: actionController.settings.redirectURL)
        webView.loadRequest(initialRequest)

        webView.frame = self.view.bounds;
        view.addSubview(webView)
        view.sendSubviewToBack(webView)

        layout(webView) { view in
            view.size   ==  view.superview!.size
            view.center == view.superview!.center
        }

        actionController.backButton = backButton
        backButton.hidden = true
        webView.navigationDelegate = actionController

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadNotificationReceived:", name: "reload", object: nil)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true;
    }

    func reloadNotificationReceived(notification: NSNotification){
        if let firstItem = webView.backForwardList.backList.first {
            webView.goToBackForwardListItem(firstItem)
        }

        let initialRequest = NSURLRequest(URL: actionController.settings.redirectURL)
        webView.loadRequest(initialRequest)
    }

    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButtonTapped(sender: AnyObject) {
        webView.goBack()
    }
}
