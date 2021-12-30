import SwiftUI

extension View {
    /// [DE Internal]
    ///
    /// - Important: This method is not designed for outside used for now!
    internal func definedRawFrame(
        width w: CGFloat,
        height h: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        return self
            .frame(width: w == .infinity || w <= 0 ? nil : w,
                   height: h == .infinity || h <= 0 ? nil : h,
                   alignment: alignment)
            .frame(maxWidth: w == .infinity ? .infinity : nil,
                   maxHeight: h == .infinity ? .infinity : nil,
                   alignment: alignment)
    }
}
