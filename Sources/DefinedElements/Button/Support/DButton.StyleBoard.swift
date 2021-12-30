import Foundation
import SwiftUI

/// [DE] Empower the clicking interaction for DefinedButton
///
/// This is an internal struct, not designed for outside usage.
struct DefinedButtonStyleBoard : ButtonStyle {
    ///
    @Binding var scaleBinding: CGFloat
    
    ///
    init(
        _ scaleBinding: Binding<CGFloat>
    ) {
        self._scaleBinding = scaleBinding
    }
    
    ///
    func makeBody(
        configuration: Configuration
    ) -> some View {
        configuration.label
            .onChange(
                of: configuration.isPressed,
                perform: { isPressed in
                    if isPressed {
                        withAnimation(.easeInOut(duration: 0.08)) {
                            self.scaleBinding = 0.935
                        }
                        DefinedHaptics.tap.press()
                    } else {
                        withAnimation(.easeInOut(duration: 0.28)) {
                            self.scaleBinding = 1.0
                        }
                        DefinedHaptics.tap.release()
                    }
                }
            )
    }
}
