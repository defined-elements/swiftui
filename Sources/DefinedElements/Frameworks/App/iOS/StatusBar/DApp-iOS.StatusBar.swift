#if os(iOS)

import SwiftUI

/// [DE Internal] A root view controller alternative to empower the ability of changing status bar style.
internal class DefinedStatusBarController: UIHostingController<DefinedViewStack> {
    /// The current status bar style holder.
    var statusBarStyle: UIStatusBarStyle = .darkContent
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    /// Change the style holder inside the controller by given style.
    ///
    /// - Parameter style: The target style.
    func changeStatusBarStyle(_ style: UIStatusBarStyle) {
        self.statusBarStyle = style
        self.setNeedsStatusBarAppearanceUpdate()
    }
}

internal extension UIApplication {
    /// [DE Internal] Set the start page of the app and empower the ability of changing status bar style.
    ///
    /// - Parameter from: The root page (start page for the root view stack) of an app.
    class func startApplication<StartPage>(from page: StartPage) where StartPage: DefinedPage {
        UIApplication.shared.windows.first?.rootViewController?.beginAppearanceTransition(false, animated: false)
        UIApplication.shared.windows.first?.rootViewController = DefinedStatusBarController(rootView: DefinedViewStack(from: page))
    }
    
    /// [DE Internal] Set the status bar style over the entire app.
    ///
    /// Handling the status bar style modification should be in `DefinedViewStack` system instead of here.
    ///
    /// - Parameter style: The target style.
    class func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let viewController = UIApplication.getKeyWindow()?.rootViewController as? DefinedStatusBarController {
            viewController.changeStatusBarStyle(style)
        }
    }
    
    private class func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.windows.first{ $0.isKeyWindow }
    }
}

#endif
