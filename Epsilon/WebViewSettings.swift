import Foundation

struct WebViewSettings {
    var redirectURL: NSURL
    var allowsSingleRedirect: Bool
    var minutesBeforeLogOut: Int
    
    static private let defaultURLString = "https://www.artsy.net/sydney-contemporary-2015/sign_up"
    static private let defaultRedirectTime = 2
    
    static private let defaultSingleDir = true
    
    func save(defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()){
        defaults.setBool(allowsSingleRedirect, forKey: "ARRedirectValue")
        defaults.setInteger(minutesBeforeLogOut, forKey: "ARMinutesBeforeLogout")
        defaults.setObject(redirectURL.absoluteString, forKey: "ARRedirectURL")
        defaults.synchronize()
    }
    
    static func loadFromDefaults(defaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()) -> WebViewSettings {
        let url: NSURL
        if let redirect = defaults.objectForKey("ARRedirectURL")  {
            if let newURL = NSURL(string: redirect as! String) {
                url = newURL
            } else {
                url = NSURL(string: defaultURLString)!
            }

        } else {
            url = NSURL(string: defaultURLString)!
        }
    
        var logoutTime = defaults.integerForKey("ARMinutesBeforeLogout")
        if logoutTime == 0 {
            logoutTime = defaultRedirectTime
        }
        let shouldRedirect = defaults.boolForKey("ARRedirectValue") ?? defaultSingleDir
        
        return WebViewSettings(redirectURL: url, allowsSingleRedirect: shouldRedirect, minutesBeforeLogOut: logoutTime)
    }
}
