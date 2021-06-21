import Foundation
import SwiftUI

///
class DefinedViewManager : ObservableObject {
    /// ViewManager 实体 < 内部变量 >
    ///
    /// - Warning: 需要禁止用户创建多个ViewStack！不符合功能设计，会导致层级错误！
    private static var instance: DefinedViewManager = DefinedViewManager()
    
    ///
    @Published var onAnimated: Bool = true // TODO: 下层View仅在侧滑时出现
    
    ///
    @Published var onRootAnimated: Bool = false
    
    /// 视图存储器
    @Published var views: [DefinedPageElement] = []
    
    /// 状态栏样式存储器
    @Published var statusBarStyles: [UIStatusBarStyle] = []
    
    /// 偏移量存储器
    @Published var offsets: [CGFloat] = [0]
    
    /// 页面宽度
    @Published var width: CGFloat = 0
    
    /// 页面高度
    @Published var height: CGFloat = 0
    
    ///
    @Published var safeAreaInsets: EdgeInsets = EdgeInsets.init()
    
    /// 页面宽度
    @Published var overallOpacity: Double = 1.0
    
    /// 构造器
    init() {
        // do nothing
    }
    
    ///
    fileprivate var viewStack = DefinedViewContainerStack() {
        didSet {
            views = viewStack.getStack()
        }
    }
    
    ///
    func push<Page>(_ target: Page) where Page: DefinedPage {
        self.offsets.append(0)
        withAnimation(.easeInOut(duration: 0.30)) {
            self.viewStack.push(DefinedPageElement(target))
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
        } else {
            withAnimation(.easeInOut(duration: 0.26)) {
                self.viewStack.pop()
            }
        }
        self.offsets.removeLast()
    }
    
    ///
    func jump<Page>(_ target: Page) where Page: DefinedPage {
        withAnimation(.easeInOut(duration: 0.50)) {
            self.renew()
            self.viewStack.push(DefinedPageElement(target))
        }
    }
    
    ///
    func renew() {
        self.viewStack.removeAll()
        self.offsets = [0]
    }
    
    // MARK: Outside Functions
    
    ///
    static func get() -> DefinedViewManager {
        return Self.instance
    }
}
