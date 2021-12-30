import SwiftUI

/// 安全区域豁免 - 视图修改器 @ DefinedElements
struct DefinedSafeAreaModifier: ViewModifier {
    /// 豁免方向
    var area: DefinedSafeAreaConfiguration
    
    /// 构造器 < 内部构造器 >
    ///
    /// - Parameters:
    ///   - area: 豁免方向
    init(area: DefinedSafeAreaConfiguration = .vertical) {
        self.area = area
    }
    
    ///
    @ViewBuilder func body(content: Content) -> some View {
        if (area == .top) {
            content
                .edgesIgnoringSafeArea(.top)
        } else if (area == .bottom) {
            content
                .edgesIgnoringSafeArea(.bottom)
        } else if (area == .vertical) {
            content
                .edgesIgnoringSafeArea(.vertical)
        } else {
            content
        }
    }
}
