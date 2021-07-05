#if os(iOS)

import Foundation
import SwiftUI

/// [DE Internal] A core manager controlling the view stack.
///
/// Should be attached to a `DefinedViewStack` for proper using.
/// One `StackManager` per `DefinedViewStack`.
class DefinedViewStackManager : ObservableObject {
    ///
    var name: String
    
    ///
    var shouldUseStatusBar: Bool
    
    /// [Deprecated]
    @Published var onAnimated: Bool = true // TODO: 下层View仅在侧滑时出现
    
    /// [Deprecated]
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
    
    /// [DE Internal]
    init(name: String, statusBar: Bool) {
        self.name = name
        self.shouldUseStatusBar = statusBar
    }
    
    ///
    internal var viewStack = DefinedViewStackContainer() {
        didSet {
            elements = viewStack.getStack()
        }
    }
    
    ///
    func push<Page>(_ target: Page) where Page: DefinedPage {
        if self.shouldUseStatusBar {
            UIApplication.setStatusBarStyle(target.statusBarStyle)
        }
        
        self.offsets.append(0)
        withAnimation(.easeInOut(duration: 0.30)) {
            self.viewStack.push(DefinedViewStackElement(target))
            
            if self.viewStack.stack.count > 1 {
                self.offsets[self.offsets.count - 2] = -self.width / 4
            }
        }
    }
    
    ///
    func pop() {
        if self.viewStack.stack.count > 1 {
            if self.shouldUseStatusBar {
                UIApplication.setStatusBarStyle(self.elements[self.elements.count - 2].statusBarStyle)
            }
            
            withAnimation(.easeInOut(duration: 0.25)) {
                if (self.offsets[self.offsets.count - 2] == 0) {
                    self.viewStack.pop()
                } else {
                    withAnimation(.easeInOut(duration: 0.26)) {
                        self.viewStack.pop()
                    }
                }
                self.offsets[self.offsets.count - 2] = 0
            }
            self.offsets.removeLast()
        } else {
            // ERROR: should NOT be able to pop right now!!!
        }
    }
    
    ///
    func jump<Page>(_ target: Page) where Page: DefinedPage {
        if self.shouldUseStatusBar {
            UIApplication.setStatusBarStyle(target.statusBarStyle)
        }
        
        withAnimation(.easeInOut(duration: 0.50)) {
            self.renew()
            self.viewStack.push(DefinedViewStackElement(target))
        }
    }
    
    ///
    func renew() {
        self.viewStack.removeAll()
        self.offsets = [0]
    }
    
    ///
    func setStatusBarStyle(_ style: UIStatusBarStyle) {
        self.elements[self.elements.count - 1].statusBarStyle = style
        UIApplication.setStatusBarStyle(style)
    }
    
    ///
    func setStatusBarStyle(pageId: UUID, style: UIStatusBarStyle) {
        let index = self.elements.firstIndex(where: { elem in return elem.id == pageId })
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
    internal static let rootId: UUID = UUID()
    
    private static var pool: [UUID: [String: DefinedViewStackManager]] = [:]
    
    internal static func get(
        name: String,
        pageId: UUID,
        shouldUseStatusBar: Bool,
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
    
    internal static func shouldRegister(name: String, pageId: UUID) -> Bool {
        return pool[pageId]?[name] == nil
    }
}

#endif
