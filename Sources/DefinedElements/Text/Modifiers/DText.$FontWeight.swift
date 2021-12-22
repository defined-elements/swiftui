import SwiftUI

extension DefinedText {
    /// [DE] Set the font weight for the text of current root view.
    ///
    /// - Parameter weight: A `Font.Weight` representing the weight of the font.
    /// - Returns: A view after modifying the font weight of root view.
    public func fontWeight(
        _ weight: Font.Weight
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextFontWeightModifier(
            weight: weight
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedText {
    /// [DE] Set the font weight for the text of current root view.
    ///
    /// - Parameter weight: A `Font.Weight` representing the weight of the font.
    /// - Returns: A view after modifying the font weight of root view.
    public func fontWeight(
        _ weight: Font.Weight
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextFontWeightModifier(
            weight: weight
        ).modify(view: self)
    }
}

extension DefinedViewTextFontWeightModifier {
    func modify(
        view: DefinedText
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedText(
            originalView: view,
            preset: DefinedTextPreset(
                font: view.preset.font,
                size: view.preset.size,
                weight: self.weight,
                specs: view.preset.specs,
                numSize: view.preset.numSize,
                numWeight: Font.Weight.plus(self.weight)
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
                size: view.root.preset.size,
                weight: self.weight,
                specs: view.root.preset.specs,
                numSize: view.root.preset.numSize,
                numWeight: Font.Weight.plus(self.weight)
            )
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
