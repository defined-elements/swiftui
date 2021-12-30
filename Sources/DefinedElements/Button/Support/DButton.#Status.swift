import Foundation

/// [DE]
///
/// - TODO: Documentation.
public enum DefinedButtonStatus {
    /// 禁用状态
    case disabled
    
    /// 默认状态
    case normal
    
    /// 加载状态（通常会有专门的加载指示动画）
    case loading
    
    /// 完成状态（通常会有定时显示或永久显示的完成指示）
    case done
}
