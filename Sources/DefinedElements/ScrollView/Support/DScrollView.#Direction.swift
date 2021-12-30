import SwiftUI

/// 滚动方向
public enum ScrollDirection {
    /// 仅允许横向滚动
    ///
    /// - Note: 元素默认横向排布
    case horizontal
    
    /// 仅允许纵向滚动
    ///
    /// - Note: 元素默认纵向排布
    case vertical
    
    /// 允许全向滚动
    case all
    
    func axis() -> Axis {
        switch self {
        case .horizontal:
            return .horizontal
        case .vertical:
            return .vertical
        case .all:
            return .vertical // 需要完成
        }
    }
    
    func axisSet() -> Axis.Set {
        switch self {
        case .horizontal:
            return .horizontal
        case .vertical:
            return .vertical
        case .all:
            return .vertical // 需要完成
        }
    }
}
