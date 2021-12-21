import SwiftUI

extension View {
    /// [DE] Set the text size for current root view.
    ///
    /// - Parameter fontSize: A `CGFloat` value representing the size of text.
    /// - Returns: A view after modifying the text size of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontSize(_ size: CGFloat) -> some View {
        return DefinedViewTextFontSizeModifier(size: size).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the text size for current root view.
    ///
    /// - Parameter fontSize: A `CGFloat` value representing the size of text.
    /// - Returns: A view after modifying the text size of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontSize(_ size: CGFloat) -> some View {
        return DefinedViewTextFontSizeModifier(size: size).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the text size for current root view.
    ///
    /// - Parameter fontSize: A `CGFloat` value representing the size of text.
    /// - Returns: A view after modifying the text size of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func fontSize(_ size: CGFloat) -> some View {
        return DefinedViewTextFontSizeModifier(size: size).modify(view: self)
    }
}

struct DefinedViewTextFontSizeModifier : DefinedViewModifier {
    let name: String = "TextFontSize"
    
    var size: CGFloat
        
    init(size: CGFloat) {
        self.size = size
    }
}
