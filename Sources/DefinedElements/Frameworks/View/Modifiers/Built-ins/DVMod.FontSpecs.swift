import SwiftUI

extension View {
    /// [DE] Set the font specification (configuration) for the text of current root view.
    ///
    /// - Parameter font: A font specification.
    /// - Returns: A view after modifying the font specs of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontSpecs(_ specs: FontSpecs) -> some View {
        return DefinedViewTextFontSpecsModifier(specs: specs).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the font specification (configuration) for the text of current root view.
    ///
    /// - Parameter font: A font specification.
    /// - Returns: A view after modifying the font specs of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontSpecs(_ specs: FontSpecs) -> some View {
        return DefinedViewTextFontSpecsModifier(specs: specs).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the font specification (configuration) for the text of current root view.
    ///
    /// - Parameter font: A font specification.
    /// - Returns: A view after modifying the font specs of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontSpecs(_ specs: FontSpecs) -> some View {
        return DefinedViewTextFontSpecsModifier(specs: specs).modify(view: self)
    }
}

struct DefinedViewTextFontSpecsModifier : DefinedViewModifier {
    let name: String = "TextFontSpecs"
    
    var specs: FontSpecs
    
    init(specs: FontSpecs) {
        self.specs = specs
    }
}
