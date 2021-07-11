#if os(iOS)

import SwiftUI

/// [DE Internal] A ViewManager element representing a page instance.
internal class DefinedViewManagerElement : Equatable {
    /// The id of the corresponding page.
    var id: UUID
    
    /// The parent stack's ViewManager element.
    var parent: DefinedViewManagerRootElement
    
    /// The stacks that are hold in this page.
    var stacks: [DefinedViewManagerRootElement] = []
    
    /// [DE Internal] Create a `DVManagerElement`.
    ///
    /// - Parameters:
    ///   - id: The page id.
    ///   - parent: The parent stack's ViewManager element.
    internal init(id: UUID, parent: DefinedViewManagerRootElement) {
        self.id = id
        self.parent = parent
    }

    /// [DE Internal] Link.
    func link<Page>(to target: Page) where Page: DefinedPage {
        parent.link(to: target)
    }
    
    /// [DE Internal] Jump.
    func jump<Page>(to target: Page) where Page: DefinedPage {
        parent.jump(to: target)
    }
    
    /// [DE Internal] Swap.
    func swap<Page>(with target: Page) where Page: DefinedPage {
        parent.swap(with: target)
    }
    
    /// [DE Internal] Back.
    func back() {
        parent.back()
    }
    
    /// [DE Internal] Set status bar style of this page.
    func setStatusBarStyle(_ style: UIStatusBarStyle) {
        parent.docker?.setStatusBarStyle(pageId: self.id, style: style)
    }
    
    /// [DE Internal] Register a new stack under this page.
    ///
    /// - Parameter root: The ViewManager element of the new stack (not a page!).
    func register(_ root: DefinedViewManagerRootElement) {
        self.stacks.append(root)
    }
    
    /// [DE Internal] Unregister all stacks under current page.
    ///
    /// It should be called when the current page is destroyed or closed.
    /// For garbage clean up purpose.
    func unregister() {
        for r in stacks {
            // run unregister stack procedure for every stack under the current page.
            DefinedViewManager.unregisterStack(root: r)
        }
    }
    
    static func == (lhs: DefinedViewManagerElement, rhs: DefinedViewManagerElement) -> Bool {
        return lhs.id == rhs.id
    }
}

extension DefinedViewManagerElement {
    /// The dummy page's ViewManager element.
    ///
    /// Being used when we cannot find the corresponding page's ViewManager element. Being designed to avoid a bunch of optional wrappers and to throw no error in order to keep all other functions work fine.
    ///
    /// When we cannot find the ViewManager element for a page by whatever reason, we will return this dummy element.
    /// It can work as the same as all other elements but it does nothing. So the program will not crash.
    /// The only thing going to happen is that you will find a warning in terminal and no expected navigation will be triggered.
    ///
    /// The reason why we do not make it an optional maneuver is that you actually should NOT try to catch it on runtime. You should absolutely avoid it before making it a production! So keep an eye on the terminal if you find something unexpected!
    static let dummy: DefinedViewManagerElement = DefinedViewManagerDummyElement()
}

/// [DE Internal] A dummy element class for `DVManagerElement`.
internal class DefinedViewManagerDummyElement : DefinedViewManagerElement {
    init() {
        super.init(id: UUID(), parent: .dummy)
    }
    
    override func link<Page>(to target: Page) where Page: DefinedPage {
        // do nothing.
    }
    
    override func jump<Page>(to target: Page) where Page: DefinedPage {
        // do nothing.
    }
    
    override func swap<Page>(with target: Page) where Page: DefinedPage {
        // do nothing.
    }
    
    override func back() {
        // do nothing.
    }
    
    override func setStatusBarStyle(_ style: UIStatusBarStyle) {
        // do nothing.
    }
    
    override func register(_ root: DefinedViewManagerRootElement) {
        // do nothing.
    }
    
    override func unregister() {
        // do nothing.
    }
}

/// [DE Internal] A ViewManager element representing a stack instance (not a page!).
internal class DefinedViewManagerRootElement : DefinedPotentialWarning, Equatable {
    var name: String = "DVManagerRootElement"
    
    /// The id of this element.
    ///
    /// It is neither an ID from outside nor syncing with other components.
    var id: UUID = UUID()
    
    /// All pages' ViewManager elements from current view stack.
    var hierarchy: [DefinedViewManagerElement] = []
    
    /// A docker linking to the actual view stack instance behind this ViewManager element.
    var docker: DefinedViewStackDocker? = nil
    
    /// The parent stack's ViewManager element (should not have one only if it is the root stack).
    var parent: DefinedViewManagerRootElement? = nil
    
    /// [DE Private] Create a root or dummy `DVManagerRootElement` that might not have a docker and a parent.
    ///
    /// - Parameters:
    ///   - docker: The docker linking to the actual view stack instance behind this ViewManager element.
    ///   - parent: The parent stack's ViewManager element.
    fileprivate init(docker: DefinedViewStackDocker? = nil, parent: DefinedViewManagerRootElement? = nil) {
        self.docker = docker
        self.parent = parent
    }
    
    /// [DE Internal] Create a `DVManagerRootElement`.
    ///
    /// Create the root stack's root element by using another initializer with optional docker and parent. Thus, this initializer requires the both.
    ///
    /// - Parameters:
    ///   - docker: The docker linking to the actual view stack instance behind this ViewManager element.
    ///   - parent: The parent stack's ViewManager element.
    internal init(docker: DefinedViewStackDocker, parent: DefinedViewManagerRootElement) {
        self.docker = docker
        self.parent = parent
    }
    
    /// [DE Internal] Link.
    internal func link<Page>(to target: Page) where Page: DefinedPage {
        if (self.docker == nil) {
            // ERROR
            return
        }
        self.docker!.link(to: target)
        
        self.hierarchy.append(DefinedViewManager.registerPage(id: target.id, parent: self))
    }
    
    /// [DE Internal] Jump.
    internal func jump<Page>(to target: Page) where Page: DefinedPage {
        if (self.docker == nil) {
            // ERROR
            return
        }
        self.docker!.jump(to: target)
    }
    
    /// [DE Internal] Swap.
    internal func swap<Page>(with target: Page) where Page: DefinedPage {
        if (self.docker == nil) {
            // ERROR
            return
        }
        self.docker!.swap(with: target)
    }
    
    /// [DE Internal] Back.
    internal func back() {
        if (self.docker == nil) {
            // ERROR
            warning("docker is null")
            return
        }
        if (hierarchy.count > 1) {
            self.docker!.back()
            let last = self.hierarchy.removeLast()
            DefinedViewManager.unregisterPage(id: last.id)
        } else {
            // TODO: back the parent page if back-parent enabled.
            // TODO: implement back-parent feature.
        }
    }
    
    static func == (lhs: DefinedViewManagerRootElement, rhs: DefinedViewManagerRootElement) -> Bool {
        return lhs.id == rhs.id
    }
}

extension DefinedViewManagerRootElement {
    /// Representing the root stack of entire page system.
    internal static let base = DefinedViewManagerRootElement()
    
    /// To be used as the parent of the dummy page's ViewManager element.
    fileprivate static let dummy = DefinedViewManagerRootElement()
}

#endif
