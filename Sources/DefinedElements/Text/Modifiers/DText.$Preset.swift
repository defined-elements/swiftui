import SwiftUI

extension DefinedText {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    public func preset(
        _ preset: DefinedTextPreset
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewTextPresetModifier(
            preset: preset
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedText {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    public func preset(
        _ preset: DefinedTextPreset
    ) -> DefinedViewModifiedView<Self.RootViewType> {
        return DefinedViewTextPresetModifier(
            preset: preset
        ).modify(view: self)
    }
}

extension DefinedViewTextPresetModifier {
    func modify(
        view: DefinedText
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedText(
            originalView: view,
            preset: preset
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
            preset: preset
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
