#if os(iOS)

import SwiftUI

/// [DE Internal] A core manager controlling the view stack.
///
/// Should be attached to a `DefinedViewStack` for proper using.
/// One `StackManager` per `DefinedViewStack`.
///
/// - TODO: Support `onAnimated` and optimize the display procedure algorithm.
internal class DefinedViewStackManager : ObservableObject {
    /// The name of the view stack.
    ///
    /// It should be the same with the `name` property in corresponding `DefinedViewStack`.
    /// For identification purpose (per page).
    var name: String
    
    /// Should this view stack modify the status bar on changing the page?
    ///
    /// Sometimes, our view stack is not showing fullscreen. In this case, we should not modify the status bar style per the page is changed or the status bar style has been set manually because the page has not covered the status bar area.
    var shouldUseStatusBar: Bool
    
    /// [Deprecated] A flag showing if the view stack is animating.
    ///
    /// It should only be `true` when we have a sub-page animates.
    /// Should not be `true` when we have a root animation.
    @Published var onAnimated: Bool = true
    
    /// [Deprecated] A flag showing if the root of a view stack is animating.
    ///
    /// It should only be `true` when we have a root animation like `jump` or root `swap`.
    @Published var onRootAnimated: Bool = false
    
    /// All elements in the view stack.
    ///
    /// Being used for obtaining the data and displaying view stack elements in `DefinedViewStack` module.
    ///
    /// - Important: You should NOT modify this immediately!
    ///              This array will be synced automatically with one inside `DefinedViewStackContainer`.
    ///              So manually modifying this array may result in fatal bugs.
    @Published var elements: [DefinedViewStackElement] = []

    /// An offset storer for all views.
    ///
    /// Being used for dynamically control the offset of each view inside view stack.
    @Published var offsets: [CGFloat] = [0]
    
    /// The entire width of stack view area.
    ///
    /// - Note: Not the width of screen!
    @Published var width: CGFloat = 0
    
    /// The entire height of stack view area.
    ///
    /// - Note: Not the height of screen!
    @Published var height: CGFloat = 0
    
    /// The safe area insets of current view stack.
    @Published var safeAreaInsets: EdgeInsets = EdgeInsets.init()
    
    /// [Deprecated] The overall opacity of current view stack.
    ///
    /// - TODO: We are not using the overall opacity for now.
    @Published var overallOpacity: Double = 1.0
    
    /// [DE Internal] Create the view stack manager with corresponding name and status bar flag.
    ///
    /// - Parameters:
    ///   - name: The name of the view stack.
    ///   - statusBar: Should this view stack modify the status bar on changing the page?
    internal init(name: String, statusBar: Bool) {
        self.name = name
        self.shouldUseStatusBar = statusBar
    }
    
    /// The view stack container.
    ///
    /// It will automatically sync with `elements` property when view stack has been changed.
    internal var viewStack = DefinedViewStackContainer() {
        didSet {
            // get update from the container.
            elements = viewStack.getStack()
        }
    }
    
    /// [DE Internal] Manual push maneuver.
    ///
    /// Push a page element onto the view stack.
    ///
    /// - Parameter target: The sub-page going to be pushed.
    internal func push<Page>(_ target: Page) where Page: DefinedPage {
        if self.shouldUseStatusBar {
            UIApplication.setStatusBarStyle(target.statusBarStyle)
        }
        
        // push a 0 first so the view can be updated safely.
        self.offsets.append(0)
        
        withAnimation(.easeInOut(duration: 0.30)) {
            self.viewStack.push(DefinedViewStackElement(target))
            
            if self.viewStack.stack.count > 1 {
                self.offsets[self.offsets.count - 2] = -self.width / 4
            }
        }
    }
    
    /// [DE Internal] Manual pop maneuver.
    ///
    /// Pop a page element onto the view stack.
    internal func pop() {
        if self.viewStack.stack.count > 1 {
            if self.shouldUseStatusBar {
                UIApplication.setStatusBarStyle(self.elements[self.elements.count - 2].statusBarStyle)
            }
            
            withAnimation(.easeInOut(duration: 0.20)) {
                // immediately pop when we clicked the back button (no drag gesture).
                self.viewStack.pop()
                
                // reset the offset and get ready for next navigation action.
                self.offsets[self.offsets.count - 2] = 0
            }
            self.offsets.removeLast()
        } else {
            // ERROR: should NOT be able to pop right now!!! We only have 1 page left!
        }
    }
    
    /// [DE Internal] Manual replace maneuver.
    ///
    /// Replace all pages in the stack with a new page as the new root.
    ///
    /// - Parameter target: The page going to replace others.
    internal func jump<Page>(_ target: Page) where Page: DefinedPage {
        if self.shouldUseStatusBar {
            UIApplication.setStatusBarStyle(target.statusBarStyle)
        }
        
        withAnimation(.easeInOut(duration: 0.50)) {
            self.renew()
            self.viewStack.push(DefinedViewStackElement(target))
        }
    }
    
    /// Renew the view stack (remove all page elements and place an original 0 to offset in order to avoid bugging when pushing the first page).
    private func renew() {
        self.viewStack.removeAll()
        self.offsets = [0]
    }
    
    /// [DE Internal] Set the status bar style of top page manually.
    ///
    /// - Parameter style: The target style.
    internal func setStatusBarStyle(_ style: UIStatusBarStyle) {
        self.elements[self.elements.count - 1].statusBarStyle = style
        UIApplication.setStatusBarStyle(style)
    }
    
    /// [DE Internal] Set the status bar style of given page (UUID) manually.
    ///
    /// - Parameters:
    ///   - pageId: The UUID of the page you want to change.
    ///   - style: The target style.
    func setStatusBarStyle(pageId: UUID, style: UIStatusBarStyle) {
        let index = self.elements.firstIndex(where: { $0.id == pageId })
        if index != nil {
            self.elements[index!].statusBarStyle = style
            if (index == self.elements.count - 1) {
                UIApplication.setStatusBarStyle(style)
            }
        }
        
    }
}

// MARK: - StackManager Pool

extension DefinedViewStackManager {
    /// The UUID correspond to the root view stack.
    internal static let rootId: UUID = UUID()
    
    /// The global pool of `DefinedViewStackManager`.
    private static var pool: [UUID: [String: DefinedViewStackManager]] = [:]
    
    /// [DE Internal] Get corresponding `DefinedViewStackManager` from the pool.
    ///
    /// - Parameters:
    ///   - name: The name of the stack.
    ///   - pageId: The page id (where the stack is AT, not the top page of the stack).
    ///   - shouldUseStatusBar: Should this stack modify the status bar style during navigation?
    ///   - rebuild: Should we recreate a new `DVStackManager` if there already exists one?
    ///
    /// - Note: If we already have a corresponding `DVStackManager` and you choose not to rebuild one, the `shouldUseStatusBar` will NOT be modified. It will keep the old configuration.
    ///
    /// - Returns: The corresponding `DVStackManager`.
    internal static func get(
        name: String,
        pageId: UUID,
        shouldUseStatusBar: Bool = false,
        rebuild: Bool = false
    ) -> DefinedViewStackManager {
        if pool[pageId] == nil {
            pool[pageId] = [:]
        }
        if pool[pageId]![name] == nil || rebuild {
            let newManager = DefinedViewStackManager(name: name, statusBar: shouldUseStatusBar)
            pool[pageId]![name] = newManager
        }
        return pool[pageId]![name]!
    }
    
    /// [DE Internal] Check if we should register this stack (check if it exists).
    ///
    /// - Parameters:
    ///   - name: The name of the stack.
    ///   - pageId: The page id (where the stack is AT, not the top page of the stack).
    ///
    /// - Returns: True for we should register it. False for we should not re-register it.
    internal static func shouldRegister(name: String, pageId: UUID) -> Bool {
        return pool[pageId]?[name] == nil
    }
}

#endif
