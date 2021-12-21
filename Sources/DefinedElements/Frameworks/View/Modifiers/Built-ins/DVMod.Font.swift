import SwiftUI

extension View {
    /// [DE] Set the font for current root view.
    ///
    /// - Parameter font: A font coming from `filename` or pre-defined `DefinedFont` variable.
    /// - Returns: A view after modifying the font of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func font(_ font: DefinedFont) -> some View {
        return DefinedViewTextFontModifier(font: font).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the font for current root view.
    ///
    /// - Parameter font: A font coming from `filename` or pre-defined `DefinedFont` variable.
    /// - Returns: A view after modifying the font of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func font(_ font: DefinedFont) -> some View {
        return DefinedViewTextFontModifier(font: font).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the font for current root view.
    ///
    /// - Parameter font: A font coming from `filename` or pre-defined `DefinedFont` variable.
    /// - Returns: A view after modifying the font of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func font(_ font: DefinedFont) -> some View {
        return DefinedViewTextFontModifier(font: font).modify(view: self)
    }
}

struct DefinedViewTextFontModifier : DefinedViewModifier {
    let name: String = "TextFont"
    
    var font: DefinedFont
    
    init(font: DefinedFont) {
        self.font = font
    }
}
