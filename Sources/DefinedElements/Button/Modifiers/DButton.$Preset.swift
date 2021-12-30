import SwiftUI

extension DefinedButton {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    public func preset(
        _ preset: DefinedButtonPreset
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewPresetModifier(
            preset: preset
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedButton {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    public func preset(
        _ preset: DefinedButtonPreset
    ) -> DefinedViewModifiedView<Self.RootViewType> {
        return DefinedViewPresetModifier(
            preset: preset
        ).modify(view: self)
    }
}

extension DefinedViewPresetModifier {
    func modify(
        view: DefinedButton
    ) -> DefinedViewModifiedView<DefinedButton> {
        print("YES: Modify \(name) for DefinedButton correctly!")
        
        let buttonPreset = self.preset as? DefinedButtonPreset
        
        let newRootView = DefinedButton(
            originalView: view,
            viewConfiguration: buttonPreset?.viewConfiguration,
            backgroundConfiguration: buttonPreset?.backgroundConfiguration,
            borderConfiguration: buttonPreset?.borderConfiguration,
            padding_left: buttonPreset?.padding_left,
            padding_right: buttonPreset?.padding_right,
            padding_top: buttonPreset?.padding_top,
            padding_bottom: buttonPreset?.padding_bottom,
            corner_radius: buttonPreset?.corner_radius,
            textColor_def: buttonPreset?.textColor_def,
            textColor_loading: buttonPreset?.textColor_loading,
            textColor_act: buttonPreset?.textColor_act,
            textColor_done: buttonPreset?.textColor_done,
            textColor_error: buttonPreset?.textColor_error,
            textColor_disabled: buttonPreset?.textColor_disabled
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
        view: DefinedViewModifiedView<DefinedButton>
    ) -> DefinedViewModifiedView<DefinedButton> {
        print("YES: Modify \(name) for DefinedViewModifiedView correctly!")
        
        let buttonPreset = self.preset as? DefinedButtonPreset
        
        let newRootView = DefinedButton(
            originalView: view.root,
            viewConfiguration: buttonPreset?.viewConfiguration,
            backgroundConfiguration: buttonPreset?.backgroundConfiguration,
            borderConfiguration: buttonPreset?.borderConfiguration,
            padding_left: buttonPreset?.padding_left,
            padding_right: buttonPreset?.padding_right,
            padding_top: buttonPreset?.padding_top,
            padding_bottom: buttonPreset?.padding_bottom,
            corner_radius: buttonPreset?.corner_radius,
            textColor_def: buttonPreset?.textColor_def,
            textColor_loading: buttonPreset?.textColor_loading,
            textColor_act: buttonPreset?.textColor_act,
            textColor_done: buttonPreset?.textColor_done,
            textColor_error: buttonPreset?.textColor_error,
            textColor_disabled: buttonPreset?.textColor_disabled
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
