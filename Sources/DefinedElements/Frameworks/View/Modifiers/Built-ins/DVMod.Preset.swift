import SwiftUI

extension View {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    private func preset<PSet: DefinedPresetProtocol>(
        _ preset: PSet
    ) -> some View {
        return DefinedViewPresetModifier(
            preset: preset
        ).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    private func preset<PSet: DefinedPresetProtocol>(
        _ preset: PSet
    ) -> some View {
        return DefinedViewPresetModifier(
            preset: preset
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    private func preset<PSet: DefinedPresetProtocol>(
        _ preset: PSet
    ) -> some View {
        return DefinedViewPresetModifier(
            preset: preset
        ).modify(view: self)
    }
}

struct DefinedViewPresetModifier<PSet: DefinedPresetProtocol> : DefinedViewModifier {
    let name: String = "Preset"
    
    var preset: PSet
    
    init(preset: PSet) {
        self.preset = preset
    }
}
