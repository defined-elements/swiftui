import Foundation

/// ShapeStyle - 形状风格 @ DefinedElements
///
/// - TODO: Documentation.
public enum DefinedShapeStyle {
    /// 普通
    ///
    /// 无任何预置风格，单一形状（默认包含填充色）。
    case plain
    
    /// 线框 < 推荐使用 >
    ///
    /// 带有分割线的纯扁平拟态形状
    case bordered
    
    /// 拟态
    ///
    /// 能够为形状增加质感与区分度，且保持简洁风格，适用于简洁风页面用作轻度元素区分。
    case skeuomorphism
    
    /// 玻璃态 < 谨慎使用 >
    ///
    /// 玻璃态是一种全新的形状风格，携带一整套完整风格，它将完全修改形状的属性，包括填充、模糊、边框、阴影等。
    ///
    /// - Warning: 请避免在需要对其进行大部分自定义时使用，可以考虑搭配其他控件如`DefinedBlur`来实现，避免过度的渲染浪费。
    ///
    /// - Note:
    ///   - 过度使用可能会导致渲染压力及层级混乱。
    ///   - 页面背景等建议使用`DefinedBlur`而非`DefinedShape`。
    case glassmorphism
}
