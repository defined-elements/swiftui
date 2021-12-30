import SwiftUI

/// [DE] A configuration class containing everything related to border working for `DefinedView` protocol system.
public struct DefinedViewBorderConfiguration {
    /// A boolean representing if this view is using `BorderConfiguration`.
    ///
    /// - Important: This variable should not be changed!
    var inactive: Bool
    
    /// The border setup when status is `default`.
    var border_def: DefinedBorder
    
    /// The border setup when status is `loading`.
    var border_loading: DefinedBorder
    
    /// The border setup when status is `active`.
    var border_act: DefinedBorder
    
    /// The border setup when status is `done`.
    var border_done: DefinedBorder
    
    /// The border setup when status is `error`.
    var border_error: DefinedBorder
    
    /// The border setup when status is `disabled`.
    var border_disabled: DefinedBorder
    
    /// [DE Internal] Do not active the Border Configuration of current view.
    ///
    /// - Parameter inactive: True if the current view does not use `BorderConfiguration`.
    public init(inactive: Bool) {
        self.inactive = inactive
        self.border_def = .default
        self.border_loading = .default
        self.border_act = .bold
        self.border_done = .default
        self.border_error = .default
        self.border_disabled = .default
    }
    
    /// [DE] Create a Border Configuration with corresponding setups.
    ///
    /// - Parameters:
    ///   - def: The border setup when status is `default`.
    ///   - loading: The border setup when status is `loading`.
    ///   - act: The border setup when status is `active`.
    ///   - done: The border setup when status is `done`.
    ///   - error: The border setup when status is `error`.
    ///   - disabled: The border setup when status is `disabled`.
    public init(
        default def: DefinedBorder? = nil,
        loading: DefinedBorder? = nil,
        active act: DefinedBorder? = nil,
        done: DefinedBorder? = nil,
        error: DefinedBorder? = nil,
        disabled: DefinedBorder? = nil
    ) {
        self.inactive = false
        self.border_def = def ?? .default
        self.border_loading = loading ?? .default
        self.border_act = act ?? .bold
        self.border_done = done ?? .default
        self.border_error = error ?? .default
        self.border_disabled = disabled ?? .default
    }
    
    // MARK: - Modifier Constructor
    
    /// [Internal]
    init(
        oldConfiguration: DefinedViewBorderConfiguration,
        border_def: DefinedBorder? = nil,
        border_loading: DefinedBorder? = nil,
        border_act: DefinedBorder? = nil,
        border_done: DefinedBorder? = nil,
        border_error: DefinedBorder? = nil,
        border_disabled: DefinedBorder? = nil
    ) {
        self.inactive = oldConfiguration.inactive // this value does not support changing
        
        self.border_def = border_def ?? oldConfiguration.border_def
        self.border_loading = border_loading ?? oldConfiguration.border_loading
        self.border_act = border_act ?? oldConfiguration.border_act
        self.border_done = border_done ?? oldConfiguration.border_done
        self.border_error = border_error ?? oldConfiguration.border_error
        self.border_disabled = border_disabled ?? oldConfiguration.border_disabled
    }
    
    internal func getBorderByStatus(
        _ status: GeneralStatus
    ) -> DefinedBorder {
        switch status {
        case .default:
            return self.border_def
        case .loading:
            return self.border_loading
        case .active:
            return self.border_act
        case .done:
            return self.border_done
        case .error:
            return self.border_error
        case .disabled:
            return self.border_disabled
        }
    }
}
