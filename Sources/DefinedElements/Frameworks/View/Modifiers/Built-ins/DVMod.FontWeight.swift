import SwiftUI

extension View {
    /// [DE] Set the font weight for the text of current root view.
    ///
    /// - Parameter weight: A `Font.Weight` representing the weight of the font.
    /// - Returns: A view after modifying the font weight of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontWeight(_ weight: Font.Weight) -> some View {
        return DefinedViewTextFontWeightModifier(weight: weight).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the font weight for the text of current root view.
    ///
    /// - Parameter weight: A `Font.Weight` representing the weight of the font.
    /// - Returns: A view after modifying the font weight of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontWeight(_ weight: Font.Weight) -> some View {
        return DefinedViewTextFontWeightModifier(weight: weight).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the font weight for the text of current root view.
    ///
    /// - Parameter weight: A `Font.Weight` representing the weight of the font.
    /// - Returns: A view after modifying the font weight of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontWeight(_ weight: Font.Weight) -> some View {
        return DefinedViewTextFontWeightModifier(weight: weight).modify(view: self)
    }
}

struct DefinedViewTextFontWeightModifier : DefinedViewModifier {
    let name: String = "TextFontWeight"
    
    var weight: Font.Weight
        
    init(weight: Font.Weight) {
        self.weight = weight
    }
}
