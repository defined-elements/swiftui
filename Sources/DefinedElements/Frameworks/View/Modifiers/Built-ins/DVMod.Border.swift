import SwiftUI

extension View {
    /// [DE] Set the border for current root view.
    ///
    /// You only need to set the status that you need.
    ///
    /// - Parameter border: The border for all status.
    /// - Returns: A view after modifying the border pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func border(_ border: DefinedBorder? = nil) -> some View {
        return DefinedViewBorderModifier(border: border).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the border for current root view.
    ///
    /// You only need to set the status that you need.
    ///
    /// - Parameter border: The border for all status.
    /// - Returns: A view after modifying the border pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func border(_ border: DefinedBorder? = nil) -> some View {
        return DefinedViewBorderModifier(border: border).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the border for current root view.
    ///
    /// You only need to set the status that you need.
    ///
    /// - Parameter border: The border for all status.
    /// - Returns: A view after modifying the border pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func border(_ border: DefinedBorder? = nil) -> some View {
        return DefinedViewBorderModifier(border: border).modify(view: self)
    }
}

struct DefinedViewBorderModifier : DefinedViewModifier {
    var name: String = "Border"
    
    var border: DefinedBorder?
    
    init(border: DefinedBorder? = nil) {
        self.border = border
    }
}
