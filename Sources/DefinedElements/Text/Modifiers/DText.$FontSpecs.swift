import SwiftUI

extension DefinedText {
    /// [DE] Set the font specification (configuration) for the text of current root view.
    ///
    /// - Parameter font: A font specification.
    /// - Returns: A view after modifying the font specs of root view.
    public func fontSpecs(
        _ specs: FontSpecs
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextFontSpecsModifier(
            specs: specs
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedText {
    /// [DE] Set the font specification (configuration) for the text of current root view.
    ///
    /// - Parameter font: A font specification.
    /// - Returns: A view after modifying the font specs of root view.
    public func fontSpecs(
        _ specs: FontSpecs
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextFontSpecsModifier(
            specs: specs
        ).modify(view: self)
    }
}

extension DefinedViewTextFontSpecsModifier {
    func modify(
        view: DefinedText
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedText(
            originalView: view,
            preset: DefinedTextPreset(
                font: view.preset.font,
                size: view.preset.size,
                weight: view.preset.weight,
                specs: self.specs,
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
    
    func modify(
        view: DefinedViewModifiedView<DefinedText>
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedViewModifiedView correctly!")
        
        let newRootView = DefinedText(
            originalView: view.root,
            preset: DefinedTextPreset(
                font: view.root.preset.font,
                size: view.root.preset.size,
                weight: view.root.preset.weight,
                specs: self.specs,
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
