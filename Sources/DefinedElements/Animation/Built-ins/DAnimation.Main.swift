import SwiftUI

public class DefinedAnimation {
    public static let spring = Animation.spring(
        response: 0.80,
        dampingFraction: 0.55,
        blendDuration: 0.40
    )
}

public extension DefinedAnimation {
    /// - TODO: Customize the duration and bounce rate, compute the values automatically.
    static func spring(h: Int) -> Animation {
        return Animation.spring(
            response: 0.80,
            dampingFraction: 0.55,
            blendDuration: 0.40
        )
    }
}
