#if os(iOS)

import Foundation
import SwiftUI

/// [DE Internal] A core manager controlling the view stack.
///
/// Should be attached to a `DefinedViewStack` for proper using.
/// One `StackManager` per `DefinedViewStack`.
class DefinedViewStackManager : ObservableObject {
    ///
    var id: UUID
    
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
    
    /// All status bar styles correponding to every element.
    ///
    /// All dynamically modified data should be stored into here instead of inside `DefinedViewStackElement`.
    /// The `statusBarStyle` field in `DefinedViewStackElement` is only used on initializing the actual stack.
    @Published var statusBarStyles: [UIStatusBarStyle] = []

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
    init() {
        self.id = UUID()
    }
    
    ///
    internal var viewStack = DefinedViewStackContainer() {
        didSet {
            elements = viewStack.getStack()
        }
    }
    
    ///
    func push<Page>(_ target: Page) where Page: DefinedPage {
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
            
//            withAnimation(.easeInOut(duration: 0.26)) {
//                self.viewStack.pop()
//            }
//            self.offsets.removeLast()
        }
    }
    
    ///
    func jump<Page>(_ target: Page) where Page: DefinedPage {
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
}

extension DefinedViewStackManager {
    private static var pool: [UUID: DefinedViewStackManager] = [:]
    
    internal static func generate() -> DefinedViewStackManager {
        let newManager = DefinedViewStackManager()
        pool[newManager.id] = newManager
        return newManager
    }
    
    internal static func find(id: UUID) -> DefinedViewStackManager? {
        return pool[id]
    }
}

#endif
