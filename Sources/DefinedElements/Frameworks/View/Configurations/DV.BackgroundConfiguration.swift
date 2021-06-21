import Foundation
import SwiftUI

/// [DE] A configuration class containing everything related to Background working for `DefinedView` protocol system.
public struct DefinedViewBackgroundConfiguration {
    /// A boolean representing if this view is using `BackgroundConfiguration`.
    ///
    /// - Important: This variable should not be changed!
    var inactive: Bool
    
    ///
    var background_def: AnyView = AnyView(EmptyView())
    
    ///
    var background_loading: AnyView = AnyView(EmptyView())
    
    ///
    var background_act: AnyView = AnyView(EmptyView())
    
    ///
    var background_done: AnyView = AnyView(EmptyView())
    
    ///
    var background_error: AnyView = AnyView(EmptyView())
    
    ///
    var background_disabled: AnyView = AnyView(EmptyView())
    
    /// [DE Internal]
    public init(inactive: Bool) {
        self.inactive = inactive
    }
    
    /// [DE] Create a Background Configuration with corresponding setups.
    ///
    /// - Parameters:
    ///   - def: The background view setup when status is `default`.
    ///   - loading: The background view setup when status is `loading`.
    ///   - act: The background view setup when status is `active`.
    ///   - done: The background view setup when status is `done`.
    ///   - error: The background view setup when status is `error`.
    ///   - disabled: The background view setup when status is `disabled`.
    public init(
        default: AnyView? = nil,
        loading: AnyView? = nil,
        active: AnyView? = nil,
        done: AnyView? = nil,
        error: AnyView? = nil,
        disabled: AnyView? = nil
    ) {
        self.inactive = false
        self.background_def = `default` ?? background_def
        self.background_loading = loading ?? background_loading
        self.background_act = active ?? background_act
        self.background_done = done ?? background_done
        self.background_error = error ?? background_error
        self.background_disabled = disabled ?? background_disabled
    }
    
    /// [Internal]
    init(
        oldConfiguration: DefinedViewBackgroundConfiguration,
        background_def: AnyView? = nil,
        background_loading: AnyView? = nil,
        background_act: AnyView? = nil,
        background_done: AnyView? = nil,
        background_error: AnyView? = nil,
        background_disabled: AnyView? = nil
    ) {
        self.inactive = oldConfiguration.inactive // this value does not support changing
        self.background_def = background_def ?? oldConfiguration.background_def
        self.background_loading = background_loading ?? oldConfiguration.background_loading
        self.background_act = background_act ?? oldConfiguration.background_act
        self.background_done = background_done ?? oldConfiguration.background_done
        self.background_error = background_error ?? oldConfiguration.background_error
        self.background_disabled = background_disabled ?? oldConfiguration.background_disabled
    }
}
