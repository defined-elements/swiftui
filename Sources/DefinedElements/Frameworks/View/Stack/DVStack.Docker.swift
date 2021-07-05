#if os(iOS)

import Foundation
import UIKit

///
public struct DefinedViewStackDocker : DefinedPotentialWarning {
    public var name: String = "DVStackDocker"
    
    internal var manager: DefinedViewStackManager?
    
    public init() {
        self.manager = nil
    }
    
    internal init(manager: DefinedViewStackManager) {
        self.manager = manager
    }
    
    ///
    public func link<Page>(to target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            manager!.push(target)
        } else {
            warning("the manager is null!")
        }
    }
    
    ///
    public func jump<Page>(to target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            manager!.jump(target)
        } else {
            warning("the manager is null!")
        }
    }
    
    ///
    public func swap<Page>(with target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            //
        } else {
            warning("the manager is null!")
        }
    }
    
    ///
    public func back() {
        if (self.manager != nil) {
            manager!.pop()
        } else {
            warning("the manager is null!")
        }
    }
    
    public func setStatusBarStyle(pageId: UUID, style: UIStatusBarStyle) {
        if (self.manager != nil) {
            manager!.setStatusBarStyle(pageId: pageId, style: style)
        } else {
            warning("the manager is null!")
        }
    }
}

#endif
