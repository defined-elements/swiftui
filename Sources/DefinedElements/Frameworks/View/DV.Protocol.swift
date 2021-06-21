import Foundation
import SwiftUI

// MARK: - Protocol

/// [DE] The protocol of the view component in `DefinedView` system.
///
/// You can also use it if you want to create your own `DefinedView` component.
///
/// - TODO: Fix `status` pointer problem.
public protocol DefinedView : View {
    /// Configurate all things related to view frame.
    ///
    /// If you do not want to constrain the view with a bridge frame, you can disable it:
    ///
    ///     var viewConfiguration = DefinedViewConfiguration(inactive: true)
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
    ///     var backgroundConfiguration = DefinedViewBackgroundConfiguration(inactive: true)
    ///
    /// otherwise, you can set the default background views by using basic initializer
    /// `init(default:loading:active:done:error:disabled:)`.
    ///
    /// - Note: This is only a configuration for the root view, not for the hierarchy level.
    var backgroundConfiguration: DefinedViewBackgroundConfiguration { get set }
    
    /// Configurate all things related to border setup.
    ///
    /// If you do not want to constrain the view with a border, you can disable it:
    ///
    ///     var borderConfiguration = DefinedViewBorderConfiguration(inactive: true)
    ///
    /// otherwise, you can set the border setup by using basic initializer
    /// `init(default:loading:active:done:error:disabled:)`.
    ///
    /// - Note: This is only a configuration for the root view, not for the hierarchy level.
    var borderConfiguration: DefinedViewBorderConfiguration { get set }
    
    /// Configurate all things related to overlay view.
    ///
    /// If you do not want to constrain the view with an overlay, you can disable it:
    ///
    ///     var overlayConfiguration = DefinedViewOverlayConfiguration(inactive: true)
    ///
    /// otherwise, you can set the default overlay views by using basic initializer
    /// `init(default:loading:active:done:error:disabled:)`.
    ///
    /// - Note: This is only a configuration for the root view, not for the hierarchy level.
    var overlayConfiguration: DefinedViewOverlayConfiguration { get set }
    
    ///
    var status: GeneralStatus { get set }
    
    // TODO: It seems like having some problem on using `$` prefix on Swift 5.5
    // var $status: Binding<GeneralStatus> { get set }
}

// MARK: - Extensions for fields

extension DefinedView {
    ///
    public var viewConfiguration: DefinedViewConfiguration {
        get {
            DefinedViewConfiguration(inactive: true)
        }
        set(value) {
            self.viewConfiguration = value
        }
    }
    
    ///
    public var backgroundConfiguration: DefinedViewBackgroundConfiguration {
        get {
            DefinedViewBackgroundConfiguration(inactive: true)
        }
        set(value) {
            self.backgroundConfiguration = value
        }
    }
    
    ///
    public var borderConfiguration: DefinedViewBorderConfiguration {
        get {
            DefinedViewBorderConfiguration(inactive: true)
        }
        set(value) {
            self.borderConfiguration = value
        }
    }
    
    ///
    public var overlayConfiguration: DefinedViewOverlayConfiguration {
        get {
            DefinedViewOverlayConfiguration(inactive: true)
        }
        set(value) {
            self.overlayConfiguration = value
        }
    }
    
    ///
    public var status: GeneralStatus {
        get {
            return .default
        }
        set(value) {
            self.status = value
        }
    }
}
