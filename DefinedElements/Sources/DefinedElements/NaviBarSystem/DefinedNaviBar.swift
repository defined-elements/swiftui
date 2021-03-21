//
//  DefinedNaviBar.swift
//
//  Created by Lingxi Li on 12/13/20.
//

import Foundation
import SwiftUI

/// DefinedNaviBar - 核心底部导航栏 @ DefinedElements
public struct DefinedNaviBar<Content> : View, DefinedView where Content : View {
    typealias Item = DefinedNaviItem
    
    private let NAVI_HEIGHT: CGFloat = 90
    private let NAVI_SIDE_PADDING: CGFloat = 45
    private let NAVI_BOTTOM_OFFSET: CGFloat = 4
    
    /// 导航列表 < 内部变量 >
    ///
    /// - Note: 用于存储传入的 DefinedNaviBarItem 。
    // @State public var naviList: [DefinedNaviItemView<Content>] = []
        
    private var content: () -> Content
    
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
    
    /// 起始页面Index < 内部变量 非强制 >
    private var startIndex: Int
    
    /// 背景变量 < 内部变量 >
    @State private var background: AnyView = AnyView(Color.white)
    
    /// UI内容
    public var body: some View {
        HStack(alignment: .center, spacing: 0) {
            process(self.content)
        }
        .padding(.bottom, NAVI_BOTTOM_OFFSET)
        .frame(maxWidth: .infinity, maxHeight: NAVI_HEIGHT)
        .padding(.horizontal, NAVI_SIDE_PADDING)
        .background(background.edgesIgnoringSafeArea(.bottom))
    }
    
    /// 构造器
    ///
    /// - Parameter front: 用于外部调用获取当前所在页面的识别器
    public init(front: Binding<DefinedNaviPage?>? = nil,
                start: Int = 0,
                @ViewBuilder cont: @escaping () -> Content) {
        if (front != nil) {
            self._front = front!
        } else {
            self._front = .constant(nil) // TODO:
        }
        self.startIndex = start
        self.content = cont
    }
    
    /// 设置导航栏背景
    ///
    /// - Parameter background: 背景元素，使用方法同 Swift 默认 `background` 。
    /// - Returns: DefinedNaviBar 本体，可供拖挂调用。
    public func background<Background>(_ background: Background)
            -> Self where Background: View {
        self.background = AnyView(background)
        
        return self
    }
}

///
extension DefinedNaviBar {
    func process(_ content: () -> Content) -> some View {
        let body = content()
        let a = Group {
            if (body is Item) {
                processor(body as! Item)
            } else if (body is TupleView<(Item, Item)>) {
                processor(body as! TupleView<(Item, Item)>)
            } else if (body is TupleView<(Item, Item, Item)>) {
                processor(body as! TupleView<(Item, Item, Item)>)
            } else if (body is TupleView<(Item, Item, Item, Item)>) {
                processor(body as! TupleView<(Item, Item, Item, Item)>)
            } else if (body is TupleView<(Item, Item, Item, Item, Item)>) {
                processor(body as! TupleView<(Item, Item, Item, Item, Item)>)
            } else {
                body
            }
        }
        return a
    }
    
    func processor(_ view: Item) -> some View {
        let (v1) = view
        return build([v1], indicator: self.$indicator)
    }
    
    func processor(_ view: TupleView<(Item, Item)>) -> some View {
        let (v1, v2) = view.value
        return build([v1, v2], indicator: self.$indicator)
    }
    
    func processor(_ view: TupleView<(Item, Item, Item)>) -> some View {
        let (v1, v2, v3) = view.value
        return build([v1, v2, v3], indicator: self.$indicator)
    }
    
    func processor(_ view: TupleView<(Item, Item, Item, Item)>) -> some View {
        let (v1, v2, v3, v4) = view.value
        return build([v1, v2, v3, v4], indicator: self.$indicator)
    }
    
    func processor(_ view: TupleView<(Item, Item, Item, Item, Item)>) -> some View {
        let (v1, v2, v3, v4, v5) = view.value
        return build([v1, v2, v3, v4, v5], indicator: self.$indicator)
    }
    
    ///
    func build(_ views: [Item], indicator: Binding<String?>) -> some View {
        let buildOutput = Group {
            ForEach((0...views.count-1), id: \.self) { i in
                Spacer()
                views[i].build(indicator)
            }
            Spacer()
        }
        return buildOutput.onAppear(perform: {
            self.indicator = views[self.startIndex].linked.tag
          })
    }
}

/// DefinedNaviBarItem < 子组件 >
///
/// DefinedNaviBar 的导航元素
/// - Important: 目前设计仅供 DefinedNaviBar 使用
public struct DefinedNaviItem : View {
    private let NAVI_ICON_SIZE: CGFloat = 34
    private let NAVI_ICON_PADDING: CGFloat = 6
    
    private var content: AnyView? = nil
        
    /// 按钮图标信息
    private var image: (String, String)? = nil
    
    /// 点击动作
    private var action: () -> Void
        
    /// 关联页面
    var linked: DefinedNaviPage
    
    public init(_ itemImage: (String, String)? = nil,
         action: @escaping () -> Void = {},
         page: DefinedNaviPage){
        self.action = action
        self.linked = page
        self.image = itemImage
    }
    
    public init<Content>(action: @escaping () -> Void = {},
                  page: DefinedNaviPage,
                  @ViewBuilder _ content: @escaping () -> Content? = { return nil }) where Content : View {
        self.action = action
        self.linked = page
        self.content = AnyView(content())
    }
    
    public var body: some View {
        EmptyView()
    }
    
    /// 该方法用于生成View元素
    func build(_ indicator: Binding<String?>) -> some View {
        if (image != nil) {
            return DefinedNaviItemView(itemImage: self.image!, itemAction: self.action, indicator: indicator, page: self.linked)
        } else {
            return DefinedNaviItemView(self.content, itemAction: self.action, indicator: indicator, page: self.linked)
        }
    }
}

///
public struct DefinedNaviItemView : View {
    private let NAVI_ICON_SIZE: CGFloat = 34
    private let NAVI_ICON_PADDING: CGFloat = 6
    
    @Binding var indicator: String?
    
    /// 按钮内容
    private var content: AnyView? = nil
    
    /// 按钮图标信息
    private var image: (String, String)? = nil
    
    /// 点击动作
    private var action: () -> Void
    
    /// 关联页面
    var linked: DefinedNaviPage
    
    ///
    init(_ content: AnyView? = nil,
         itemImage: (String, String)? = nil,
         itemAction: @escaping () -> Void = {},
         indicator: Binding<String?>,
         page: DefinedNaviPage) {
        self._indicator = indicator
        self.image = itemImage
        self.action = itemAction
        self.linked = page
        self.content = content
    }
    
    /// - TODO: 按钮的特殊状态。
    /// - TODO: 图标宽度做 iPad 和 macOS 的适配。
    public var body: some View {
        Button(action: {
            self.indicator = self.linked.tag
            self.action()
        }){
            VStack(alignment: .center, spacing: 0) {
                if (self.image != nil) {
                    getIconByImage(self.image!, indicator: self.$indicator)
                } else {
                    self.content
                }
            }
            .frame(maxWidth: 46, maxHeight: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color.blue)
    }
    
    private func getIconByImage(_ image: (String, String), indicator: Binding<String?>) -> some View {
        let (activeIcon, defaultIcon) = image
        var curr: some View {
            Text(self.indicator == self.linked.tag ? activeIcon : defaultIcon)
                .style()
        }
        // TODO: 临时用文字代替
//        var curr: some View {
//            Image(self.indicator == self.linked.tag ? activeIcon : defaultIcon)
//                .resizable()
//                .scaledToFit()
//                .frame(maxWidth: NAVI_ICON_SIZE, maxHeight: NAVI_ICON_SIZE, alignment: .center)
//                .padding(NAVI_ICON_PADDING)
//        }
        return curr
    }
}

struct DefinedNaviBar_Previews: PreviewProvider {
    static var previews: some View {
        DefinedNaviBar {
            DefinedNaviItem(("12", "23"), page: DefinedNaviBarTestPage())
        }
    }
}

struct DefinedNaviBarTestPage : DefinedPage, DefinedNaviPage {
    var tag: String = "defined-test-page"
    var page: AnyView { AnyView(self) }
    
    var main: some View {
        Text("Hello, World! from TEST")
            .style(.content)
            .definedFullSize()
    }
}
