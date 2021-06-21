import Foundation
import SwiftUI

/// [DE] A configuration class containing everything related to Overlay working for `DefinedView` protocol system.
public struct DefinedViewOverlayConfiguration {
    /// A boolean representing if this view is using `OverlayConfiguration`.
    ///
    /// - Important: This variable should not be changed!
    var inactive: Bool
    
    ///
    var overlay_def: AnyView = AnyView(EmptyView())
    
    ///
    var overlay_loading: AnyView = AnyView(EmptyView())
    
    ///
    var overlay_act: AnyView = AnyView(EmptyView())
    
    ///
    var overlay_done: AnyView = AnyView(EmptyView())
    
    ///
    var overlay_error: AnyView = AnyView(EmptyView())
    
    ///
    var overlay_disabled: AnyView = AnyView(EmptyView())
    
    /// [DE Internal]
    public init(inactive: Bool) {
        self.inactive = inactive
    }
    
    /// [DE] Create an Overlay Configuration with corresponding setups.
    ///
    /// - Parameters:
    ///   - def: The overlay view setup when status is `default`.
    ///   - loading: The overlay view setup when status is `loading`.
    ///   - act: The overlay view setup when status is `active`.
    ///   - done: The overlay view setup when status is `done`.
    ///   - error: The overlay view setup when status is `error`.
    ///   - disabled: The overlay view setup when status is `disabled`.
    public init(
        default: AnyView? = nil,
        loading: AnyView? = nil,
        active: AnyView? = nil,
        done: AnyView? = nil,
        error: AnyView? = nil,
        disabled: AnyView? = nil
    ) {
        self.inactive = false
        self.overlay_def = `default` ?? overlay_def
        self.overlay_loading = loading ?? overlay_loading
        self.overlay_act = active ?? overlay_act
        self.overlay_done = done ?? overlay_done
        self.overlay_error = error ?? overlay_error
        self.overlay_disabled = disabled ?? overlay_disabled
    }
    
    /// [Internal]
    init(
        oldConfiguration: DefinedViewOverlayConfiguration,
        overlay_def: AnyView? = nil,
        overlay_loading: AnyView? = nil,
        overlay_act: AnyView? = nil,
        overlay_done: AnyView? = nil,
        overlay_error: AnyView? = nil,
        overlay_disabled: AnyView? = nil
    ) {
        self.inactive = oldConfiguration.inactive // this value does not support changing
        self.overlay_def = overlay_def ?? oldConfiguration.overlay_def
        self.overlay_loading = overlay_loading ?? oldConfiguration.overlay_loading
        self.overlay_act = overlay_act ?? oldConfiguration.overlay_act
        self.overlay_done = overlay_done ?? oldConfiguration.overlay_done
        self.overlay_error = overlay_error ?? oldConfiguration.overlay_error
        self.overlay_disabled = overlay_disabled ?? oldConfiguration.overlay_disabled
    }
}
