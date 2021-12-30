import SwiftUI

/// [DE Internal]
internal class DefinedButtonConfiguration {
    /// [DE Internal]
    internal init(
        text: String = "",
        footnote: String? = nil,
        icon: Image? = nil,
        scale: CGFloat = 1.0,
        shouldHaptic: Bool = false,
        haptic: DefinedHapticBuilder = DefinedHapticBuilder()
    ) {
        self.text = text
        self.footnote = footnote
        self.icon = icon
        self.scale = scale
        self.shouldHaptic = shouldHaptic
        self.haptic = haptic
    }
    
    /// [DE Internal]
    internal init(
        oldConfiguration: DefinedButtonConfiguration,
        text: String? = nil,
        footnote: String? = nil,
        icon: Image? = nil,
        scale: CGFloat? = nil,
        shouldHaptic: Bool? = nil,
        haptic: DefinedHapticBuilder? = nil
    ) {
        self.text = text ?? oldConfiguration.text
        self.footnote = footnote ?? oldConfiguration.footnote
        self.icon = icon ?? oldConfiguration.icon
        self.scale = scale ?? oldConfiguration.scale
        self.shouldHaptic = shouldHaptic ?? oldConfiguration.shouldHaptic
        self.haptic = haptic ?? oldConfiguration.haptic
    }
    
    // MARK: - Preset Values
    
    ///
    var text: String
    
    ///
    var footnote: String? = nil
    
    ///
    var icon: Image? = nil
    
    // MARK: - Animation Values
    
    ///
    var scale: CGFloat
    
    ///
    var shouldHaptic: Bool
    
    ///
    var haptic: DefinedHapticBuilder
}
