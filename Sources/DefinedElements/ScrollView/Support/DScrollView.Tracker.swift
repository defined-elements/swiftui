import SwiftUI

/// ScrollTracker - 滚动跟踪器
struct ScrollTracker: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}
