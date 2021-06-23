#if os(iOS)

import Foundation

///
public struct DefinedViewStackDocker {
    private var manager: DefinedViewManager?
    
    public init() {
        self.manager = nil
    }
    
    init(manager: DefinedViewManager) {
        self.manager = manager
    }
    
    ///
    public func link<Page>(to target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            manager!.push(target)
        } else {
            //
        }
    }
    
    ///
    public func jump<Page>(to target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            manager!.jump(target)
        } else {
            //
        }
    }
    
    ///
    public func swap<Page>(to target: Page) where Page: DefinedPage {
        if (self.manager != nil) {
            //
        } else {
            //
        }
    }
    
    ///
    public func back() {
        if (self.manager != nil) {
            manager!.pop()
        } else {
            //
        }
    }
}

#endif
