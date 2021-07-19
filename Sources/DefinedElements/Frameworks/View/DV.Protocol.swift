import SwiftUI

// MARK: - Protocol

/// [DE] The protocol of the view component in `DefinedView` system.
///
/// You can also use it if you want to create your own `DefinedView` component.
///
/// - TODO: Finish the development of Configurations.
public protocol DefinedView : View {
    /// Configurate all things related to view frame.
    ///
    /// If you do not want to constrain the view with a bridge frame, you can disable it:
    ///
    /// ``` swift
    /// var viewConfiguration = DefinedViewConfiguration(inactive: true)
    /// ```
    ///
    /// otherwise, you can set the default frame size by using basic initializer
    /// `init(default:loading:active:done:error:disabled:)`.
    ///
    /// - Note: This is only a configuration for the root view, not for the hierarchy level.
    var viewConfiguration: DefinedViewConfiguration { get set }
    
    /// Configurate all things related to background view.
    ///
    /// If you do not want to constrain the view with background views, you can disable it:
    ///
    /// ``` swift
    /// var backgroundConfiguration = DefinedViewBackgroundConfiguration(inactive: true)
    /// ```
    ///
    /// otherwise, you can set the default background views by using basic initializer
    /// `init(default:loading:active:done:error:disabled:)`.
    ///
    /// - Note: This is only a configuration for the root view, not for the hierarchy level.
    var backgroundConfiguration: DefinedViewBackgroundConfiguration { get set }
    
    /// Configurate all things related to border setup.
    ///
    /// If you do not want to constrain the view with a border, you can disable it:
    /// ``` swift
    /// var borderConfiguration = DefinedViewBorderConfiguration(inactive: true)
    /// ```
    ///
    /// otherwise, you can set the border setup by using basic initializer
    /// `init(default:loading:active:done:error:disabled:)`.
    ///
    /// - Note: This is only a configuration for the root view, not for the hierarchy level.
    var borderConfiguration: DefinedViewBorderConfiguration { get set }
    
    /// Configurate all things related to overlay view.
    ///
    /// If you do not want to constrain the view with an overlay, you can disable it:
    /// ``` swift
    /// var overlayConfiguration = DefinedViewOverlayConfiguration(inactive: true)
    /// ```
    ///
    /// otherwise, you can set the default overlay views by using basic initializer
    /// `init(default:loading:active:done:error:disabled:)`.
    ///
    /// - Note: This is only a configuration for the root view, not for the hierarchy level.
    var overlayConfiguration: DefinedViewOverlayConfiguration { get set }
    
    /// The status of an UI component.
    var status: GeneralStatus { get set }
}

// MARK: - Extensions for fields

extension DefinedView {
    ///
    public var viewConfiguration: DefinedViewConfiguration {
        get {
            DefinedViewConfiguration(inactive: true)
        }
        set {
            // WARNING: should not be assigned without defining it locally!
            DefinedWarning.send(from: "DefinedViewProtocol", "You should NOT do things with viewConfiguration if you did not define it locally. Nothing is going to be changed if you proceed.")
        }
    }
    
    ///
    public var backgroundConfiguration: DefinedViewBackgroundConfiguration {
        get {
            DefinedViewBackgroundConfiguration(inactive: true)
        }
        set {
            // WARNING: should not be assigned without defining it locally!
            DefinedWarning.send(from: "DefinedViewProtocol", "You should NOT do things with backgroundConfiguration if you did not define it locally. Nothing is going to be changed if you proceed.")
        }
    }
    
    ///
    public var borderConfiguration: DefinedViewBorderConfiguration {
        get {
            DefinedViewBorderConfiguration(inactive: true)
        }
        set {
            // WARNING: should not be assigned without defining it locally!
            DefinedWarning.send(from: "DefinedViewProtocol", "You should NOT do things with borderConfiguration if you did not define it locally. Nothing is going to be changed if you proceed.")
        }
    }
    
    ///
    public var overlayConfiguration: DefinedViewOverlayConfiguration {
        get {
            DefinedViewOverlayConfiguration(inactive: true)
        }
        set {
            // WARNING: should not be assigned without defining it locally!
            DefinedWarning.send(from: "DefinedViewProtocol", "You should NOT do things with overlayConfiguration if you did not define it locally. Nothing is going to be changed if you proceed.")
        }
    }
    
    ///
    public var status: GeneralStatus {
        get {
            return .default
        }
        set {
            // WARNING: should not be assigned without defining it locally!
            DefinedWarning.send(from: "DefinedViewProtocol", "You should NOT do things with status if you did not define it locally. Nothing is going to be changed if you proceed.")
        }
    }
}
