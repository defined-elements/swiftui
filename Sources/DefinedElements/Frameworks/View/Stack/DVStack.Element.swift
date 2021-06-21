import Foundation
import SwiftUI

/// 该结构服务于`DefinedViewStack` < 内部组件 >
struct DefinedViewStackElement : Identifiable, Equatable {
    ///
    static var constantId: Int = 0
    
    /// Element 标签
    let id: String
    
    /// Element 内容
    let content: AnyView
    
    /// Element 状态栏设定（默认值）
    ///
    /// - Note: 状态栏设定的变动在ViewManager中而非此处，该值仅用于页面初始化的时候
    var statusBarStyle: UIStatusBarStyle = .darkContent
    
    /// 构造器 - AnyView
    ///
    /// - Parameter view: 给定视图
    init(_ view: AnyView) {
        self.id = "constant-\(DefinedPageElement.constantId)"
        self.content = view
        
        DefinedPageElement.constantId += 1
    }
    
    /// 构造器 - DefinedPage
    ///
    /// - Parameter view: 给定视图
    init<Page>(_ view: Page) where Page: DefinedPage {
        self.id = "constant-\(DefinedPageElement.constantId)"
        self.content = AnyView(view)
        self.statusBarStyle = view.statusBarStyle
        
        DefinedPageElement.constantId += 1
    }
    
    /// 构造器 - DefinedPage + Tag
    ///
    /// - Parameters:
    ///   - tag: 页面标签（用于只出现一次的页面，防止页面被先后推送至不同层次或反复使用）
    ///   - view: 给定视图
    init<Page>(_ tag: String, _ view: Page) where Page: DefinedPage {
        self.id = tag
        self.content = AnyView(view)
        self.statusBarStyle = view.statusBarStyle
    }

    /// 用于相同比较 < 内部函数 >
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

