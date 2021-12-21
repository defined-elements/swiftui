import SwiftUI

/// [DE] The preset for the view of text.
///
/// We have a lot of modifier functions and built-in presets right for you.
/// When you need it for setting a text view, you can either initialize one or use presets by typing the dot (`.`) first.
///
/// **Built-in Presets**
/// - title
/// - half-title
/// - third-title
/// - subtitle
/// - header-title
/// - button
/// - body
/// - sidebody
/// - content
/// - note
/// - footnote
/// - digits
/// - emoji
///
public class DefinedTextPreset : TextPresetProtocol {
    /// The font for text.
    public var font: DefinedFont
    
    /// The font size for text.
    public var size: CGFloat
    
    /// The font weight for text.
    public var weight: Font.Weight
    
    /// The font specification for text.
    ///
    /// For better understanding, it includes: `line_spacing` and `letter_spacing`.
    /// They are corresponding to: `line-spacing` and `letter-spacing`.
    public var specs: FontSpecs
    
    /// The font size for numeric text.
    public var numSize: CGFloat
    
    /// The font weight for numeric text.
    public var numWeight: Font.Weight

    /// [DE] Create a font specification object.
    ///
    /// - Parameters:
    ///   - font: The font for text.
    ///   - size: The font size for text.
    ///   - weight: The font weight for text.
    ///   - specs: The font specification for text. See `FontSpecs`.
    ///   - numSize: The font size for numeric text.
    ///   - numWeight: The font weight for numeric text.
    public init(font: DefinedFont = .default,
                size: CGFloat = 16,
                weight: Font.Weight = .regular,
                specs: FontSpecs = .default,
                numSize: CGFloat = 18,
                numWeight: Font.Weight = .semibold) {
        self.font = font
        self.size = size
        self.weight = weight
        self.specs = specs
        
        self.numSize = numSize
        self.numWeight = numWeight
    }
    
    /// [DE] Render the TextView based on current font specs.
    public func render(view: Text) -> some View {
        return view
            .font(self.font.get(dynamic: self.size))
            .fontWeight(self.weight)
            .tracking(self.specs.letter_spacing)
            .lineSpacing(self.specs.line_spacing)
    }
    
    /// [DE] Get the numeric font specs of current font specs.
    ///
    /// - Note:
    ///   Suggest to use it on number-only text views.
    public static func num(_ base: DefinedTextPreset) -> DefinedTextPreset {
        return DefinedTextPreset(font: base.font,
                                 size: base.numSize,
                                 weight: base.numWeight,
                                 specs: base.specs)
    }
    
    /// [DE] Get a thinner font weight specs based on current font specs.
    public func thin() -> DefinedTextPreset {
        return DefinedTextPreset(font: self.font,
                                 size: self.size,
                                 weight: DefinedTextPreset.minus(self.weight),
                                 specs: self.specs)
    }
    
    /// [DE] Get a thinner font weight specs based on given font specs.
    public static func thin(_ base: DefinedTextPreset) -> DefinedTextPreset {
        return DefinedTextPreset(font: base.font,
                                 size: base.size,
                                 weight: minus(base.weight),
                                 specs: base.specs)
    }
    
    /// [DE] Get a stronger font weight specs based on current font specs.
    public static func emph(_ base: DefinedTextPreset) -> DefinedTextPreset {
        return DefinedTextPreset(font: base.font,
                                 size: base.size,
                                 weight: plus(base.weight),
                                 specs: base.specs)
    }
    
    /// [DE] Get a larger font size specs based on current font specs.
    public func large() -> DefinedTextPreset {
        return DefinedTextPreset(font: self.font,
                                 size: self.size + 1,
                                 weight: self.weight,
                                 specs: self.specs)
    }
    
    /// [DE] Get a larger font size specs based on given font specs.
    public static func large(_ base: DefinedTextPreset) -> DefinedTextPreset {
        return DefinedTextPreset(font: base.font,
                                 size: base.size + 1,
                                 weight: base.weight,
                                 specs: base.specs)
    }
    
    /// [DE] Get a smaller font size specs based on current font specs.
    public func small() -> DefinedTextPreset {
        return DefinedTextPreset(font: self.font,
                                 size: self.size - 1,
                                 weight: self.weight,
                                 specs: self.specs)
    }
    
    /// [DE] Get a smaller font size specs based on given font specs.
    public static func small(_ base: DefinedTextPreset) -> DefinedTextPreset {
        return DefinedTextPreset(font: base.font,
                                 size: base.size - 1,
                                 weight: base.weight,
                                 specs: base.specs)
    }
    
    /// [DE] Modify the font specs based on current font specs.
    public func specs(_ specs: FontSpecs) -> DefinedTextPreset {
        return DefinedTextPreset(font: self.font,
                                 size: self.size,
                                 weight: self.weight,
                                 specs: specs)
    }
    
    /// [DE] Modify the font specs by given letter-spacing and line-spacing based on current font specs.
    public func specs(letter_spacing: CGFloat = FontSpecs.default.letter_spacing,
                      line_spacing: CGFloat = FontSpecs.default.line_spacing) -> DefinedTextPreset {
        return DefinedTextPreset(font: self.font,
                                 size: self.size,
                                 weight: self.weight,
                                 specs: FontSpecs(letter_spacing: letter_spacing, line_spacing: line_spacing))
    }
    
    /// [DE] Modify the font specs based on given font specs.
    public static func specs(_ base: DefinedTextPreset, specs: FontSpecs) -> DefinedTextPreset {
        return DefinedTextPreset(font: base.font,
                                 size: base.size,
                                 weight: base.weight,
                                 specs: specs)
    }
    
    /// [DE] Modify the font specs to `widespan` specs based on current font specs.
    public func widespan() -> DefinedTextPreset {
        return DefinedTextPreset(font: self.font,
                                 size: self.size,
                                 weight: self.weight,
                                 specs: .wide)
    }
    
}

// MARK: - Built-in Presets

public extension DefinedTextPreset {
    /// [DE] A text preset with large title style.
    static let largeTitle = DefinedTextPreset(size: 34, weight: .bold,
                                         numSize: 35, numWeight: .bold)
    
    /// [DE] A text preset with standard title style.
    static let title = DefinedTextPreset(size: 31, weight: .bold,
                                         numSize: 32, numWeight: .bold)
    
    /// [DE] A text preset with secondary title style.
    static let secondTitle = DefinedTextPreset(size: 24, weight: .bold,
                                              numSize: 25, numWeight: .bold)
    
    /// [DE] A text preset with third title style.
    static let thirdTitle = DefinedTextPreset(size: 18, weight: .semibold,
                                               numSize: 19, numWeight: .semibold)
    
    /// [DE] A text preset with sub-title style.
    ///
    /// Usually work as a brief detail of another title.
    static let subtitle = DefinedTextPreset(size: 15, weight: .medium)
    
    /// [DE] A text preset with title style for header system.
    static let header_title = DefinedTextPreset(size: 23, weight: .bold,
                                              numSize: 24, numWeight: .bold)
    
    /// [DE] A text preset with standard button style.
    static let button = DefinedTextPreset(size: 18.5, weight: .semibold)
    
    /// [DE] A text preset for body.
    static let body = DefinedTextPreset(size: 16)
    
    /// [DE] A text preset for sidebody, a smaller body.
    static let sidebody = DefinedTextPreset(size: 14.5)
    
    /// [DE] A text preset for content, a bolder body.
    static let content = DefinedTextPreset(size: 16, weight: .medium,
                                           numSize: 17, numWeight: .semibold)
    
    /// [DE] A text preset for note. Usually for side note.
    static let note = DefinedTextPreset(size: 12.5, weight: .regular,
                                        numSize: 13.5, numWeight: .semibold)
    
    /// [DE] A text preset for very little note. Usually next to a body.
    static let footnote = DefinedTextPreset(size: 11.5, weight: .regular, specs: .wide)
    
    /// [DE] A text preset for large digits.
    static let digits = DefinedTextPreset(size: 45, weight: .bold)
    
    /// [DE] A text preset for emojis.
    static let emoji = DefinedTextPreset(size: 50)
    
}
