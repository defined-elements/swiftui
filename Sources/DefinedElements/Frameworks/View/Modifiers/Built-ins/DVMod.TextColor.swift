import SwiftUI

extension View {
    /// [DE] Set the text color for current root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func textColor(_ color: Color) -> some View {
        return DefinedViewTextColorModifier(color: color).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the text color for current root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func textColor(_ color: Color) -> some View {
        return DefinedViewTextColorModifier(color: color).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the text color for current root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func textColor(_ color: Color) -> some View {
        return DefinedViewTextColorModifier(color: color).modify(view: self)
    }
}

struct DefinedViewTextColorModifier : DefinedViewModifier {
    let name: String = "TextColor"
    
    var color: Color
    
    init(color: Color) {
        self.color = color
    }
}
