import SwiftUI

/// [DE] A global font style class that enhances the experience on defining the font globally.
public class DefinedFont {
    /// [Private] A global variable storing the global font setup.
    ///
    /// It should keep private and be accessed by `DefinedFont.default` property.
    private static var defaultFont = DefinedFont("")
    
    /// [DE] The default font style for the entire app lifecycle.
    ///
    /// You can modify it by calling `DefinedFont.setDefault(_:)`.
    public static let `default`: DefinedFont = DefinedFont.defaultFont
    
    /// The file name of the font.
    ///
    /// You should implement the font file path in the Build Phase of your project configuration part.
    /// Simply put the font files path under the "Copy Bundle Resources" tab and use font-family name (may not work) or the file name (without suffix) to generate the font.
    internal var fileName: String
    
    /// [DE] Create a `DefinedFont` object by given file name.
    ///
    /// - Note: Simply put the font files path under the "Copy Bundle Resources" tab and use font-family name (may not work) or the file name (without suffix) to generate the font.
    ///
    /// For example, we have a bunch of font files and one of them is called `sarasa-fixed-sc-regular.ttf`. I can simply call the `init(_:)` by doing:
    /// ``` swift
    /// let font = DefinedFont("sarasa-fixed-sc-regular")
    /// ```
    ///
    /// That's it! And most of the times, it will also be able to set different font weight under the same font when there are different weight of the same font exists! You do not have to set different `DefinedFont` object for different weight's files!
    ///
    /// - Parameter fileName: The file name of the font (without suffix).
    public init(_ fileName: String) {
        self.fileName = fileName
    }
    
    /// [DE] Get the `Font` object by given dynamic font size.
    ///
    /// This function behaves the same with `get(dynamic:)`. This is just a short-hand.
    ///
    /// Dynamic font size means that the font size will be adjusted when there is not enough space for the `Text` module to display. If you do not expect this behavior, use `get(fixed:)` instead.
    ///
    /// - Parameter size: The font size for the output Font.
    /// - Returns: Generated SwiftUI native Font object based on current `DefinedFont`.
    public func get(_ size: CGFloat) -> Font {
        return Font.custom(self.fileName, size: size)
    }
    
    /// [DE] Get the `Font` object by given dynamic font size.
    ///
    /// Dynamic font size means that the font size will be adjusted when there is not enough space for the `Text` module to display. If you do not expect this behavior, use `get(fixed:)` instead.
    ///
    /// - Parameter size: The font size for the output Font.
    /// - Returns: Generated SwiftUI native Font object based on current `DefinedFont`.
    public func get(dynamic size: CGFloat) -> Font {
        return Font.custom(self.fileName, size: size)
    }
    
    /// [DE] Get the `Font` object by given fixed font size.
    ///
    /// Fixed font size means that the font size will NOT be adjusted when there is not enough space for the `Text` module to display. It will simply break to a new line or being cut out. If you expect the behavior of font size adjustment, use `get(dynamic:)` instead.
    ///
    /// - Parameter size: The **fixed** font size for the output Font.
    /// - Returns: Generated SwiftUI native Font object based on current `DefinedFont`.
    public func get(fixed size: CGFloat) -> Font {
        return Font.custom(self.fileName, fixedSize: size)
    }
    
    /// [DE] Set global default font style.
    ///
    /// Once you call this function, all font instances that are using the default font style (which has no modified font style stored) will be replaced to use the given font style.
    ///
    /// Simply call like this:
    /// ```
    /// DefinedFont.setDefault(.yourFontStyle)
    /// ```
    ///
    /// Highly recommend to call on startup.
    ///
    /// - Parameter def: The global font style you want to use.
    public static func setDefault(_ font: DefinedFont) {
        self.defaultFont.fileName = font.fileName
    }
}
