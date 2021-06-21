import Foundation
import SwiftUI

// MARK: - Protocol

/// [DE] The protocol of the view component in `DefinedView` system.
///
/// You can also use it if you want to create your own `DefinedView` component.
public protocol DefinedView : View {
    ///
    var viewConfiguration: DefinedViewConfiguration { get set }
    
    ///
    var backgroundConfiguration: DefinedViewBackgroundConfiguration { get set }
    
    ///
    var borderConfiguration: DefinedViewBorderConfiguration { get set }
    
    ///
    var status: GeneralStatus { get set }
    
    ///
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
    public var status: GeneralStatus {
        get {
            return .default
        }
        set(value) {
            self.status = value
        }
    }
}
