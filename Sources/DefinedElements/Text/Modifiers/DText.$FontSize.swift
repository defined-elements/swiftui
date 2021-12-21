import SwiftUI

extension DefinedText {
    /// [DE] Set the text size for current root view.
    ///
    /// - Parameter fontSize: A `CGFloat` value representing the size of text.
    /// - Returns: A view after modifying the text size of root view.
    public func fontSize(
        _ size: CGFloat
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextFontSizeModifier(
            size: size
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedText {
    /// [DE] Set the text size for current root view.
    ///
    /// - Parameter fontSize: A `CGFloat` value representing the size of text.
    /// - Returns: A view after modifying the text size of root view.
    public func fontSize(
        _ size: CGFloat
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextFontSizeModifier(
            size: size
        ).modify(view: self)
    }
}

extension DefinedViewTextFontSizeModifier {
    func modify(
        view: DefinedText
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedText(
            originalView: view,
            preset: DefinedTextPreset(
                font: view.preset.font,
                size: self.size,
                weight: view.preset.weight,
                specs: view.preset.specs,
                numSize: self.size + 1,
                numWeight: view.preset.numWeight
            )
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: .init(),
            content: { root in
                root
            }
        )
    }
    
    func modify(
        view: DefinedViewModifiedView<DefinedText>
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedViewModifiedView correctly!")
        
        let newRootView = DefinedText(
            originalView: view.root,
            preset: DefinedTextPreset(
                font: view.root.preset.font,
                size: self.size,
                weight: view.root.preset.weight,
                specs: view.root.preset.specs,
                numSize: self.size + 1,
                numWeight: view.root.preset.numWeight
            )
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
