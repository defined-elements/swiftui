import SwiftUI

extension View {
    /// [DE] Set the content color for current root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func contentColor(_ color: Color) -> some View {
        return DefinedViewContentColorModifier(color: color).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the content color for current root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func contentColor(_ color: Color) -> some View {
        return DefinedViewContentColorModifier(color: color).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the content color for current root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func contentColor(_ color: Color) -> some View {
        return DefinedViewContentColorModifier(color: color).modify(view: self)
    }
}

struct DefinedViewContentColorModifier : DefinedViewModifier {
    let name: String = "ContentColor"
    
    var color: Color
    
    init(color: Color) {
        self.color = color
    }
}
