import SwiftUI

/// - TODO: 重写modify方式
public extension View {
    ///
    ///
    /// - TODO: fix the order bug
    func onScrolling(_ perform: @escaping (CGFloat) -> Void) -> some View {
        return Group {
            if let view = self as? DefinedScrollView {
                view.onScrolling(perform)
            } else {
                self
            }
        }
    }
}
