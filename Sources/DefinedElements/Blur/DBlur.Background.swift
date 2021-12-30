import SwiftUI

///
public struct DefinedBlurBackground : DefinedView {
    let opa: Double = DEColor.std.opa
    
    public var body: some View {
        DefinedBlur(
            blurStyle: .systemUltraThinMaterial
        ).overlay(DEColor.blur.light)
    }
}
