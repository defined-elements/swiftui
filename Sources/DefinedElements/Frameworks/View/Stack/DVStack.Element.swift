#if os(iOS)

import Foundation
import SwiftUI

/// 该结构服务于`DefinedViewStack` < 内部组件 >
///
/// - Note: The reason why we do not use generic type for `DefinedPage` is we will not be able to define an array of this.
struct DefinedViewStackElement : Identifiable, Equatable {
    /// [Internal]
    static var constantLevel: Int = 0
    
    /// Element 标签
    let id: UUID
    
    ///
    let level: Int
    
    /// Element 内容
    let content: AnyView
    
    /// Element 状态栏设定（默认值）
    ///
    /// - Note: 状态栏设定的变动在ViewManager中而非此处，该值仅用于页面初始化的时候
    var statusBarStyle: UIStatusBarStyle = .darkContent
    
    /// 构造器 - DefinedPage
    ///
    /// - Parameter view: 给定视图
    init<Page>(_ page: Page) where Page: DefinedPage {
        self.id = page.id
        self.level = DefinedViewStackElement.constantLevel
        self.content = AnyView(page)
        self.statusBarStyle = page.statusBarStyle
        
        DefinedViewStackElement.constantLevel += 1
    }

    /// 用于相同比较 < 内部函数 >
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
}

#endif
