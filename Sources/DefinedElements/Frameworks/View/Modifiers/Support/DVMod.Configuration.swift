import SwiftUI

/// [DE Internal] Configuration object for `DefinedViewModifiedView`.
///
/// This class is designed for internal usage only. We do not need this object outside.
///
/// =====
///
/// **What is an Isolated Layer?**
///
/// Based on the basic mental model of SwiftUI, the frame, background, and more are not just properties of a view.
/// You can recursively define backgrounds and they will wrap the inner one again and again instead of overriding.
///
/// And since we bring a new status-based design pattern into the Defined Elements,
/// we need to make sure that the wrap happens at the correct time,
/// and does exactly what we are looking for as the status-based design pattern.
///
/// Therefore, we use layers to distinguish the wraps.
/// In basic SwiftUI, each time you define a background or a frame is creating a new layer.
/// In DE, each time you define a repeated background or a repeated/full frame is creating a new layer.
///
/// In other words, you can define different backgrounds for different statuses on the same layer,
/// where they should not be put into the separate layers because they trigger on different statuses.
///
/// However, when you define a background for the same layer twice (you defined it before, and try to define again),
/// you are intentionally making a new layer (a similar behavior to wrap a new background in basic SwiftUI).
/// Thus, after that, all other statuses' background you define will be put into the new layer.
/// And because this is a new layer,
/// you can define statuses of backgrounds you have set on previous layer again and that should be fine.
///
/// - TODO: To be fully documented.
/// - TODO: Border things and overlay things are not finished yet.
internal struct DefinedViewModifiedViewConfiguration {
    /// An isolation flag showing if the background of an isolated layer has been set on `default`.
    ///
    /// If the background of the root view has been set, we are going into the `forceBackground(_:)` method.
    /// This method wraps the background outside the root view instead of setting into the root view.
    var isBackgroundIsolated_def: Bool = false
    
    /// An isolation flag showing if the background of an isolated layer has been set on `loading`.
    ///
    /// If the background of the root view has been set, we are going into the `forceBackground(_:)` method.
    /// This method wraps the background outside the root view instead of setting into the root view.
    var isBackgroundIsolated_loading: Bool = false
    
    /// An isolation flag showing if the background of an isolated layer has been set on `active`.
    ///
    /// If the background of the root view has been set, we are going into the `forceBackground(_:)` method.
    /// This method wraps the background outside the root view instead of setting into the root view.
    var isBackgroundIsolated_act: Bool = false
    
    /// An isolation flag showing if the background of an isolated layer has been set on `done`.
    ///
    /// If the background of the root view has been set, we are going into the `forceBackground(_:)` method.
    /// This method wraps the background outside the root view instead of setting into the root view.
    var isBackgroundIsolated_done: Bool = false
    
    /// An isolation flag showing if the background of an isolated layer has been set on `error`.
    ///
    /// If the background of the root view has been set, we are going into the `forceBackground(_:)` method.
    /// This method wraps the background outside the root view instead of setting into the root view.
    var isBackgroundIsolated_error: Bool = false
    
    /// An isolation flag showing if the background of an isolated layer has been set on `disabled`.
    ///
    /// If the background of the root view has been set, we are going into the `forceBackground(_:)` method.
    /// This method wraps the background outside the root view instead of setting into the root view.
    var isBackgroundIsolated_disabled: Bool = false
    
    /// The configuration set of backgrounds on different statuses.
    var backgroundConfiguration: DefinedViewBackgroundConfiguration = .init()
    
    /// An isolation flag showing if the border of an isolated layer has been set on `default`.
    ///
    /// If the border of the root view has been set, we are going into the `forceBorder(_:)` method.
    /// This method wraps the border outside the root view instead of setting into the root view.
    var isBorderIsolated_def: Bool = false
    
    /// An isolation flag showing if the border of an isolated layer has been set on `loading`.
    ///
    /// If the border of the root view has been set, we are going into the `forceBorder(_:)` method.
    /// This method wraps the border outside the root view instead of setting into the root view.
    var isBorderIsolated_loading: Bool = false
    
    /// An isolation flag showing if the border of an isolated layer has been set on `active`.
    ///
    /// If the border of the root view has been set, we are going into the `forceBorder(_:)` method.
    /// This method wraps the border outside the root view instead of setting into the root view.
    var isBorderIsolated_act: Bool = false
    
    /// An isolation flag showing if the border of an isolated layer has been set on `done`.
    ///
    /// If the border of the root view has been set, we are going into the `forceBorder(_:)` method.
    /// This method wraps the border outside the root view instead of setting into the root view.
    var isBorderIsolated_done: Bool = false
    
    /// An isolation flag showing if the border of an isolated layer has been set on `error`.
    ///
    /// If the border of the root view has been set, we are going into the `forceBorder(_:)` method.
    /// This method wraps the border outside the root view instead of setting into the root view.
    var isBorderIsolated_error: Bool = false
    
    /// An isolation flag showing if the border of an isolated layer has been set on `disabled`.
    ///
    /// If the border of the root view has been set, we are going into the `forceBorder(_:)` method.
    /// This method wraps the border outside the root view instead of setting into the root view.
    var isBorderIsolated_disabled: Bool = false
    
    /// The configuration set of borders on different statuses.
    var borderConfiguration: DefinedViewBorderConfiguration = .init()
    
    /// [DE Internal] Simply create a BorderConfiguration instance for DVMV.
    init() {
        // do nothing.
    }
    
    /// [Internal]
    init(
        oldConfiguration: DefinedViewModifiedViewConfiguration,
        isBackgroundIsolated_def: Bool? = nil,
        isBackgroundIsolated_loading: Bool? = nil,
        isBackgroundIsolated_act: Bool? = nil,
        isBackgroundIsolated_done: Bool? = nil,
        isBackgroundIsolated_error: Bool? = nil,
        isBackgroundIsolated_disabled: Bool? = nil,
        backgroundConfiguration: DefinedViewBackgroundConfiguration? = nil,
        isBorderIsolated_def: Bool? = nil,
        isBorderIsolated_loading: Bool? = nil,
        isBorderIsolated_act: Bool? = nil,
        isBorderIsolated_done: Bool? = nil,
        isBorderIsolated_error: Bool? = nil,
        isBorderIsolated_disabled: Bool? = nil,
        borderConfiguration: DefinedViewBorderConfiguration? = nil
    ) {
        self.isBackgroundIsolated_def = isBackgroundIsolated_def ?? oldConfiguration.isBackgroundIsolated_def
        self.isBackgroundIsolated_loading = isBackgroundIsolated_loading ?? oldConfiguration.isBackgroundIsolated_loading
        self.isBackgroundIsolated_act = isBackgroundIsolated_act ?? oldConfiguration.isBackgroundIsolated_act
        self.isBackgroundIsolated_done = isBackgroundIsolated_done ?? oldConfiguration.isBackgroundIsolated_done
        self.isBackgroundIsolated_error = isBackgroundIsolated_error ?? oldConfiguration.isBackgroundIsolated_error
        self.isBackgroundIsolated_disabled = isBackgroundIsolated_disabled ?? oldConfiguration.isBackgroundIsolated_disabled
        self.backgroundConfiguration = backgroundConfiguration ?? oldConfiguration.backgroundConfiguration
        self.isBorderIsolated_def = isBorderIsolated_def ?? oldConfiguration.isBorderIsolated_def
        self.isBorderIsolated_loading = isBorderIsolated_loading ?? oldConfiguration.isBorderIsolated_loading
        self.isBorderIsolated_act = isBorderIsolated_act ?? oldConfiguration.isBorderIsolated_act
        self.isBorderIsolated_done = isBorderIsolated_done ?? oldConfiguration.isBorderIsolated_done
        self.isBorderIsolated_error = isBorderIsolated_error ?? oldConfiguration.isBorderIsolated_error
        self.isBorderIsolated_disabled = isBorderIsolated_disabled ?? oldConfiguration.isBorderIsolated_disabled
        self.borderConfiguration = borderConfiguration ?? oldConfiguration.borderConfiguration
    }
    
    func backgroundIsolation(
        default def: Bool = false,
        loading: Bool = false,
        active: Bool = false,
        done: Bool = false,
        error: Bool = false,
        disabled: Bool = false
    ) -> DefinedViewModifiedViewConfiguration {
        return DefinedViewModifiedViewConfiguration(
            oldConfiguration: self,
            isBackgroundIsolated_def: def ? true : nil,
            isBackgroundIsolated_loading: loading ? true : nil,
            isBackgroundIsolated_act: active ? true : nil,
            isBackgroundIsolated_done: done ? true : nil,
            isBackgroundIsolated_error: error ? true : nil,
            isBackgroundIsolated_disabled: disabled ? true : nil
        )
    }
    
    func setMVBackground(
        default def: AnyView? = nil,
        loading: AnyView? = nil,
        active: AnyView? = nil,
        done: AnyView? = nil,
        error: AnyView? = nil,
        disabled: AnyView? = nil
    ) -> DefinedViewModifiedViewConfiguration {
        var newBackgroundConfiguration = self.backgroundConfiguration
        newBackgroundConfiguration.background_def = def ?? self.backgroundConfiguration.background_def
        newBackgroundConfiguration.background_loading = loading ?? self.backgroundConfiguration.background_loading
        newBackgroundConfiguration.background_act = active ?? self.backgroundConfiguration.background_act
        newBackgroundConfiguration.background_done = done ?? self.backgroundConfiguration.background_done
        newBackgroundConfiguration.background_def = def ?? self.backgroundConfiguration.background_def
        newBackgroundConfiguration.background_def = def ?? self.backgroundConfiguration.background_def
        return DefinedViewModifiedViewConfiguration(
            oldConfiguration: self,
            backgroundConfiguration: newBackgroundConfiguration
        )
    }
    
    func borderIsolation(
        default def: Bool = false,
        loading: Bool = false,
        active: Bool = false,
        done: Bool = false,
        error: Bool = false,
        disabled: Bool = false
    ) -> DefinedViewModifiedViewConfiguration {
        return DefinedViewModifiedViewConfiguration(
            oldConfiguration: self,
            isBorderIsolated_def: def ? true : nil,
            isBorderIsolated_loading: loading ? true : nil,
            isBorderIsolated_act: active ? true : nil,
            isBorderIsolated_done: done ? true : nil,
            isBorderIsolated_error: error ? true : nil,
            isBorderIsolated_disabled: disabled ? true : nil
        )
    }
}
