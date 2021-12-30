#if os(iOS)

import SwiftUI

/// [DE Internal] A docker connecting between `DVStackManager` and `DVManagerElement`.
internal struct DefinedViewStackDocker : DefinedPotentialWarning {
    internal var name: String = "DVStackDocker"
    
    /// The corresponding `DVStackManager`.
    ///
    /// - Note: Was planned to use it directly on building the page so it kept optional. Don't worry! For now we forced an required `DVStackManager` in `init(manager:)`.
    internal var manager: DefinedViewStackManager?
    
    /// [DE Internal] Create a docker with given `DVStackManager`.
    ///
    /// - Parameter manager: The corresponding `DVStackManager`.
    internal init(manager: DefinedViewStackManager) {
        self.manager = manager
    }
    
    /// [DE Internal] Link to the target page.
    ///
    /// - Parameter target: The target page.
    internal func link<Page>(to target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            manager!.push(target)
        } else {
            warning("the manager is null!")
        }
    }
    
    /// [DE Internal] Jump to the target page.
    ///
    /// - Parameter target: The target page.
    internal func jump<Page>(to target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            manager!.jump(target)
        } else {
            warning("the manager is null!")
        }
    }
    
    /// [DE Internal] Swap with the target page.
    ///
    /// - Parameter target: The target page.
    internal func swap<Page>(with target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            //
        } else {
            warning("the manager is null!")
        }
    }
    
    /// [DE Internal] Go back to previous page.
    internal func back() {
        if (self.manager != nil) {
            manager!.pop()
        } else {
            warning("the manager is null!")
        }
    }
    
    /// [DE Internal] Set status bar style by given page id and target style.
    ///
    /// - Parameters:
    ///   - pageId: The id of the page that going to change its status bar style.
    ///   - style: The target style.
    internal func setStatusBarStyle(pageId: UUID, style: UIStatusBarStyle) {
        if (self.manager != nil) {
            manager!.setStatusBarStyle(pageId: pageId, style: style)
        } else {
            warning("the manager is null!")
        }
    }
    
    /// [DE Internal]
    internal func getViewStackInformation() -> DefinedViewStackInformation {
        if (self.manager != nil) {
            return DefinedViewStackInformation(
                width: manager!.width,
                height: manager!.height,
                safeAreaInsets: manager!.safeAreaInsets
            )
        }
        return DefinedViewStackInformation()
    }
}

#endif
