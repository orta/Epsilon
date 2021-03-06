import UIKit
import RxSwift
import RxCocoa

class AdminViewController: UIViewController {
    var settings = WebViewSettings.loadFromDefaults()
    var disposeBag = DisposeBag()

    @IBOutlet weak var defaultWebPageTextField: UITextField!
    @IBOutlet weak var timeoutTimeTextField: UITextField!


    override func viewDidLoad() {

        defaultWebPageTextField.text = settings.redirectURL.absoluteString
        defaultWebPageTextField.rx_text
            .distinctUntilChanged()
            .map({ NSURL(string: $0)! })
            .subscribeNext({ [weak self] in self?.settings.redirectURL = $0 })
            .addDisposableTo(disposeBag)

        timeoutTimeTextField.text =  String(settings.minutesBeforeLogOut)
        timeoutTimeTextField.rx_text
            .distinctUntilChanged()
            .map({ Int($0) ?? 0 })
            .subscribeNext({ [weak self] in self?.settings.minutesBeforeLogOut = $0 })
            .addDisposableTo(disposeBag)
    }

    @IBAction func backTapped(sender: AnyObject) {
        settings.save()
        if let webViewController = presentingViewController as? WebViewController {
            let initialRequest = NSURLRequest(URL: settings.redirectURL)
            webViewController.webView.loadRequest(initialRequest)
        }
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction
    func save() {
        settings.save()
        exit(EXIT_SUCCESS)
    }
}
