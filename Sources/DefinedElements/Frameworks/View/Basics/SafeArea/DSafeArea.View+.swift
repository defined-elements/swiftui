import SwiftUI

/// ExceedSafeArea - 安全区域豁免
public extension View {
    /// 安全区域豁免函数 < 外部函数 >
    ///
    /// # 使用范例
    /// - 豁免顶部的安全区域
    ///
    ///       View(...)
    ///           .defined(exceed_safe_area: .top)
    ///
    /// - Parameter safeArea: 豁免区域（目前只支持垂直区域）
    /// - Returns: 修改完安全区域豁免的视图
    func defined(
        exceed_safe_area safeArea: DefinedSafeAreaConfiguration
    ) -> some View {
        modifier(DefinedSafeAreaModifier(area: safeArea))
    }
    
    /// 安全区域豁免函数 < 外部函数 >
    ///
    /// # 使用范例
    /// - 豁免顶部的安全区域
    ///
    ///       View(...)
    ///           .definedExceedSafeArea(.top)
    ///
    /// - Parameter safeArea: 豁免区域（目前只支持垂直区域）
    /// - Returns: 修改完安全区域豁免的视图
    func definedExceedSafeArea(
        _ safeArea: DefinedSafeAreaConfiguration = .vertical
    ) -> some View {
        self.defined(exceed_safe_area: safeArea)
    }
}
