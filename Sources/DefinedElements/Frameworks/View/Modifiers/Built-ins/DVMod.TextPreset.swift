import SwiftUI

extension View {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func preset(_ preset: DefinedTextPreset) -> some View {
        return DefinedViewTextPresetModifier(preset: preset).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func preset(_ preset: DefinedTextPreset) -> some View {
        return DefinedViewTextPresetModifier(preset: preset).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the text preset for current root view.
    ///
    /// - Parameter preset: A text preset that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text preset of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func preset(_ preset: DefinedTextPreset) -> some View {
        return DefinedViewTextPresetModifier(preset: preset).modify(view: self)
    }
}

struct DefinedViewTextPresetModifier : DefinedViewModifier {
    let name: String = "TextPreset"
    
    var preset: DefinedTextPreset
    
    init(preset: DefinedTextPreset) {
        self.preset = preset
    }
}
