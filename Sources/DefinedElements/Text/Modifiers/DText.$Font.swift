import SwiftUI

extension DefinedText {
    /// [DE] Set the font for current root view.
    ///
    /// - Parameter font: A font coming from `filename` or pre-defined `DefinedFont` variable.
    /// - Returns: A view after modifying the font of root view.
    public func font(
        _ font: DefinedFont
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextFontModifier(
            font: font
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedText {
    /// [DE] Set the font for current root view.
    ///
    /// - Parameter font: A font coming from `filename` or pre-defined `DefinedFont` variable.
    /// - Returns: A view after modifying the font of root view.
    public func font(
        _ font: DefinedFont
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextFontModifier(
            font: font
        ).modify(view: self)
    }
}

extension DefinedViewTextFontModifier {
    func modify(view: DefinedText) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedText(
            originalView: view,
            preset: DefinedTextPreset(
                font: self.font,
                size: view.preset.size,
                weight: view.preset.weight,
                specs: view.preset.specs,
                numSize: view.preset.numSize,
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
    
    func modify(view: DefinedViewModifiedView<DefinedText>) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedViewModifiedView correctly!")
        
        let newRootView = DefinedText(
            originalView: view.root,
            preset: DefinedTextPreset(
                font: self.font,
                size: view.root.preset.size,
                weight: view.root.preset.weight,
                specs: view.root.preset.specs,
                numSize: view.root.preset.numSize,
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
