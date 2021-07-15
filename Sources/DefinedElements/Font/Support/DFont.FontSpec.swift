import SwiftUI

/// [DE] A class containing the specification of font for the view of some text.
public class FontSpecs {
    /// [DE] The default font specs.
    public static let `default` = FontSpecs(letter_spacing: 0.5,
                                            line_spacing: 4.5)
    
    /// [DE] The wide font specs (another default built-in font specs).
    public static let wide = FontSpecs(letter_spacing: 1.7,
                                       line_spacing: FontSpecs.default.line_spacing)
    
    /// The spacing between letters.
    public var letter_spacing: CGFloat
    
    /// The spacing between lines.
    public var line_spacing: CGFloat
    
    /// [DE] Create a custom font specs with your own letter-spacing.
    ///
    /// - Parameter letter_spacing: The spacing between letters.
    public init(letter_spacing: CGFloat) {
        self.letter_spacing = letter_spacing
        self.line_spacing = FontSpecs.default.line_spacing
    }
    
    /// [DE] Create a custom font specs with your own line-spacing.
    ///
    /// - Parameter line_spacing: The spacing between lines.
    public init(line_spacing: CGFloat) {
        self.letter_spacing = FontSpecs.default.letter_spacing
        self.line_spacing = line_spacing
    }
    
    /// [DE] Create a custom font specs.
    ///
    /// - Parameters:
    ///   - letter_spacing: The spacing between letters.
    ///   - line_spacing: The spacing between lines.
    public init(letter_spacing: CGFloat = FontSpecs.default.letter_spacing,
                line_spacing: CGFloat = FontSpecs.default.line_spacing) {
        self.letter_spacing = letter_spacing
        self.line_spacing = line_spacing
    }
}
