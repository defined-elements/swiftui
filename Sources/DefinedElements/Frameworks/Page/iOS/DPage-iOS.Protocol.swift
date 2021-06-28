#if os(iOS)

import Foundation
import SwiftUI

/// DefinedPage - 页面基础协议 @ DefinedElements
///
/// 这套页面协议目前来说能够和原生`View`做出区分，能够基于页面框架实现更多专属于页面的功能，以及页面的快速跳转等。
/// 这都是原生无法实现或者极其繁琐的。
///
/// 无法保证渲染效率能抗衡原生，目前暂时没有纯渲染层的优化能力。
///
/// - Note: 若您使用`Defined`配套控件，则该协议非常重要。
///
/// - Important: `DefinedViewStack`强制依赖于该页面框架！
///
/// - TODO: StatusBarStyle seemless embed.
public protocol DefinedPage : View, ModifiableStruct {
    
    // MARK: - Protocol - Main Part
    
    /// The main controller using to control your current page.
    ///
    /// This is optional, but highly recommanded because you will lose the control without it.
    /// Only NOT implement it when this page is used for an only-one-page stack.
    ///
    /// - Important: If you do not implement this on your page, you may NOT be able to control the router!
    ///   Even the short-hand functions like `link(to:)` and `jump(to:)` will all be disabled without controller!
    var controller: DefinedPageController { get }
    
    ///
    var id: UUID { get }
    
    ///
    var statusBarStyle: UIStatusBarStyle { get }
    
    ///
    associatedtype Content: View
    
    /// 页面主体
    @ViewBuilder var main: Content { get }
    
    /// 在页面加载开始前所执行的事项
    ///
    /// - Important: 非强制要求调用
    func beforePageLoading() -> Void
    
    /// 当页面加载完后所执行的事项
    ///
    /// - Important: 非强制要求调用
    func onPageLoaded() -> Void
    
    /// 当页面结束时所执行的事项
    ///
    /// - Important: 非强制要求调用
    func onPageEnded() -> Void
}

public extension DefinedPage {
    var controller: DefinedPageController {
        DefinedPageController()
    }
    
    var id: UUID {
        controller.id
    }
}

// MARK: - LifeCycle

/// 核心生命的方法
public extension DefinedPage {
    /// 在页面加载开始前所执行的事项 < 默认方法 >
    ///
    /// - Important: 非强制要求调用
    func beforePageLoading() -> Void {
        // do nothing.
        return
    }
    
    /// 当页面加载完后所执行的事项 < 默认方法 >
    ///
    /// - Important: 非强制要求调用
    func onPageLoaded() -> Void {
        // do nothing.
        return
    }
    
    /// 当页面结束时所执行的事项 < 默认方法 >
    ///
    /// - Important: 非强制要求调用
    func onPageEnded() -> Void {
        // do nothing.
        return
    }
}

// MARK: - StatusBarStyle

/// StatusBarStyle 默认值
public extension DefinedPage {
    /// 状态栏颜色 < 外部参数 >
    ///
    /// - Note: 默认为黑色内容
    var statusBarStyle: UIStatusBarStyle { .darkContent }
}

// MARK: - Link - link()

/// DefinedLink 子页面跳转功能
public extension DefinedPage {
    /// 纯代码页面跳转 < 前端函数 >
    ///
    /// 使用时在`DefinedPage`内直接调用即可
    ///
    ///     link(to: TargetPage())
    ///
    /// - Requires: 所有页面必须基于`DefinedPage`框架
    ///
    /// - Parameter target: 目标页面
    func link<Page>(to target: Page) where Page : DefinedPage {
        let pageElement = DefinedViewManager.find(self)
        pageElement.link(to: target)
    }
    
    /// 纯代码页面跳转 带延时 < 前端函数 >
    ///
    /// 使用时在`DefinedPage`内直接调用即可
    ///
    /// ```
    /// link(to: TargetPage())
    /// ```
    ///
    /// - Requires: 所有页面必须基于`DefinedPage`框架
    ///
    /// - Parameters:
    ///     - target: 目标页面
    ///     - delay: 延时（秒）
    func link<Page>(to target: Page, delay: Double) where Page : DefinedPage {
        if delay >= 0.0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                link(to: target)
            }
        }
    }
    
    /// 计时器 < 前端函数 >
    ///
    /// - Parameters:
    ///     - delay: 延时（秒）
    ///     - execute: 执行内容
    func timer(delay: Double, execute: @escaping @convention(block) () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            execute()
        }
    }
}

// MARK: - Link - back()

/// DefinedLink 子页面返回功能
extension DefinedPage {
    /// 执行返回操作 < 前端函数 >
    public func back() {
        DefinedViewManager.find(self).back()
    }
}

// MARK: - Scene - jump()

/// DefinedScene 根页面跳转功能
public extension DefinedPage {
    /// 纯代码根页面跳转 < 前端函数 >
    ///
    /// - Parameter target: 目标页面
    func jump<Page>(to target: Page) where Page : DefinedPage {
        DefinedViewManager.find(self).jump(to: target)
    }
    
    /// 纯代码根页面跳转 带延时 < 前端函数 >
    ///
    /// - Parameters:
    ///     - target: 目标页面
    ///     - delay: 延时（秒）
    func jump<Page>(to target: Page, delay: Double) where Page : DefinedPage {
        if delay >= 0.0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                jump(to: target)
            }
        }
    }
}

// MARK: - Core - Process

/// 核心Body的处理
extension DefinedPage {
    /// 根视图 < 内部变量 >
    public var body: some View {
        beforePageLoading()
        return process()
    }
    
    /// [DE Private]
    @ViewBuilder private func process() -> some View {
        ZStack {
            self.main
        }
        .onAppear(perform: onPageLoaded)
        .onDisappear(perform: onPageEnded)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DEColor.bg.light.edgesIgnoringSafeArea(.all))
    }
}

#endif
