//
//  DefinedNaviBar.swift
//
//  Created by Lingxi Li on 12/13/20.
//

import Foundation
import SwiftUI

/// DefinedNaviBar - 底部导航栏 for 页面
struct DefinedNaviBar: View {
    private let NAVI_HEIGHT: CGFloat = 90
    private let NAVI_SIDE_PADDING: CGFloat = 45
    private let NAVI_BOTTOM_OFFSET: CGFloat = 4
    
    /// 导航列表 < 内部变量 >
    ///
    /// - Note: 用于存储传入的 DefinedNaviBarItem 。
    @State private var naviList: [DefinedNaviBarItem] = []
    
    /// 页面识别器 < 内部变量 >
    ///
    /// - Note: 如果需要在调用 DefinedNaviBar 的页面进行页面 Tag 的识别，可以直接通过调用 `front` 的 `tag` 来实现。
    /// - Note: 不提供外部 `indicator` 参数。
    @State private var indicator: String?
    
    /// 前端页面变量 < 外部强制 Binding 变量 >
    ///
    /// 该 Binding 用于在主页面实现当前 Fragment 的显示。
    ///
    ///     DefinedNaviBar(front: self.$front)
    ///
    /// - Important: 注意 Binding 类型为 "DefinedNaviPage?" 。
    @Binding var front: DefinedNaviPage?
    
    /// 背景变量 < 内部变量 >
    @State private var background: AnyView = AnyView(Color.white)
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(0 ..< naviList.count) { index in
                naviList[index]
            }
        }
        .padding(.bottom, NAVI_BOTTOM_OFFSET)
        .frame(maxWidth: .infinity, maxHeight: NAVI_HEIGHT)
        .padding(.horizontal, NAVI_SIDE_PADDING)
        .background(background.edgesIgnoringSafeArea(.bottom))
    }
    
    /// 新增导航元素
    ///
    /// 该方法用于部署 DefinedNaviBar 的菜单元素，拖挂调用。按顺序重复调用以添加多个不同菜单元素。调用方法如下：
    ///
    ///     DefinedNaviBar(...)
    ///         .item(
    ///             // 该组件为开发者自行根据需求创建的 Fragment，记得添加类型 DefinedNaviPage。
    ///             HomePage()
    ///         )
    ///
    /// - Parameter linkedPage: 传入一个新的 DefinedNaviPage 页面，用于点击相应菜单项目后显示。
    /// - Parameter action: 对应菜单下的点击动作。
    /// - Returns: DefinedNaviBar 本体，可供拖挂调用。
    @inlinable public func item(linkedPage: DefinedNaviPage, action: @escaping () -> Void = {})
            -> DefinedNaviBar {
        let item = DefinedNaviBarItem(indicator: $indicator, action: action, linkedPage: linkedPage)
        if (self.indicator == nil) {
            self.indicator = linkedPage.tag
        }
        naviList.append(item)
        
        return self
    }
    
    /// 设置导航栏背景
    ///
    /// - Parameter background: 背景元素，使用方法同 Swift 默认 `background` 。
    /// - Returns: DefinedNaviBar 本体，可供拖挂调用。
    @inlinable public func background<Background>(_ background: Background)
            -> DefinedNaviBar where Background: View {
        self.background = AnyView(background)
        
        return self
    }
}

/// DefinedNaviPage
///
/// 用于给 Fragment 添加变量定义以更好地与 DefinedNaviBar 进行适配。
/// - Important: 在定义 Fragment 的时候，务必添加 DefinedNaviPage 类型。
protocol DefinedNaviPage {
    /// 标签（用于区分，可在特殊情况下重复）
    var tag: String { get }
    
    /// 默认状态
    var defaultIcon: String { get }
    
    /// 激活状态
    var activeIcon: String { get }
}

/// DefinedNaviBarItem
///
/// DefinedNaviBar 的导航元素
/// - Important: 目前设计仅供 DefinedNaviBar 使用，暂无外部使用需求。
struct DefinedNaviBarItem: View {
    private let NAVI_ICON_SIZE: CGFloat = 34
    
    @Binding var indicator: String?
    
    var action: () -> Void = {} // 点击动作
    
    var linkedPage: DefinedNaviPage
    
    /// - TODO: 按钮的特殊状态。
    /// - TODO: 图标宽度做 iPad 和 macOS 的适配。
    var body: some View {
        Button(action: {
            action()
        }){
            VStack(alignment: .center, spacing: 0) {
                Image(linkedPage.tag == indicator ? linkedPage.activeIcon : linkedPage.defaultIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: NAVI_ICON_SIZE, maxHeight: NAVI_ICON_SIZE, alignment: .center)
                    .padding(6)
            }
            .frame(maxWidth: 46, maxHeight: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}
