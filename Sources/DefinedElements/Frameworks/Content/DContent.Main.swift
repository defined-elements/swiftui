import SwiftUI

/// 界面元素容器 @ DefinedElements
public struct DefinedContent<Content> : DefinedView where Content: View {
    ///
    public var content: () -> Content
    
    ///
    var layout: DefinedContentLayoutType = .overlay
    
    ///
    var spacing: CGFloat = 0
    
    ///
    var alignment: Alignment = .center
    
    /// DefinedContent 构造器
    ///
    /// - Parameters:
    ///   - layout: 布局类型
    ///   - alignment: 对齐方式
    ///   - spacing: 子组件统一间距（默认无间距）
    ///   - cont: 子元素包裹
    public init(_ layout: DefinedContentLayoutType = .overlay,
                alignment: Alignment = .center,
                spacing: CGFloat = 0,
                @ViewBuilder _ cont: @escaping () -> Content) {
        // TODO: 寻找如果Content中包含特定元素则提取出来进行状态回调
        self.content = cont
        self.layout = layout
        self.alignment = alignment
        self.spacing = spacing
    }
    
    /// 界面主体
    public var body: some View {
        if self.layout == .horizontal {
            HStack(alignment: self.alignment.vertical, spacing: self.spacing) {
                content()
            }
        } else if self.layout == .vertical {
            VStack(alignment: self.alignment.horizontal, spacing: self.spacing) {
                content()
            }
        } else {
            ZStack(alignment: self.alignment) {
                content()
            }
        }
    }
}
