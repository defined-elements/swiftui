import Foundation
import SwiftUI

///
class DefinedStatusBarController: UIHostingController<AnyView> {
    var statusBarStyle: UIStatusBarStyle = .darkContent
    var previousStatusBarStyle: UIStatusBarStyle = .darkContent
    
    ///
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    ///
    func changeStatusBarStyle(_ style: UIStatusBarStyle) {
        self.previousStatusBarStyle = self.statusBarStyle
        self.statusBarStyle = style
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    ///
    func getCurrStatusBarStyle() -> UIStatusBarStyle {
        return statusBarStyle
    }
    
    ///
    func changeToLastStatusBarStyle() {
        changeStatusBarStyle(self.previousStatusBarStyle)
    }
}

///
public extension UIApplication {
    ///
    class func setController<Content>(rootView: Content) where Content : View {
        UIApplication.shared.windows.first?.rootViewController?.beginAppearanceTransition(false, animated: false)
        UIApplication.shared.windows.first?.rootViewController = DefinedStatusBarController(rootView: AnyView(rootView))
    }
    
    ///
    class func setLastStatusBarStyle() {
        if let vc = UIApplication.getKeyWindow()?.rootViewController as? DefinedStatusBarController {
            vc.changeToLastStatusBarStyle()
        }
    }
    
    ///
    class func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let vc = UIApplication.getKeyWindow()?.rootViewController as? DefinedStatusBarController {
            vc.changeStatusBarStyle(style)
        }
    }
    
    ///
    private class func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.windows.first{ $0.isKeyWindow }
    }
}
