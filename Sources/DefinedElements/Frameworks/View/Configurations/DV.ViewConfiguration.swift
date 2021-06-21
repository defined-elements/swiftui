import Foundation
import SwiftUI

/// [DE] A configuration class working for `DefinedView` protocol system.
public struct DefinedViewConfiguration {
    /// A boolean representing if the `width` and `height` are activated for defining the internal frame size.
    ///
    /// - Important: This variable should not be changed!
    var inactive: Bool
    
    ///
    var width: CGFloat
    
    ///
    var height: CGFloat
    
    ///
    var isWidthConstrained: Bool
    
    ///
    var isHeightConstrained: Bool
    
    ///
    public init() {
        self.inactive = false
        self.width = 0
        self.isWidthConstrained = false
        self.height = 0
        self.isHeightConstrained = false
    }
    
    ///
    public init(inactive: Bool) {
        self.inactive = inactive
        self.width = 0
        self.isWidthConstrained = false
        self.height = 0
        self.isHeightConstrained = false
    }
    
    ///
    public init(width: CGFloat, height: CGFloat) {
        self.inactive = false
        self.width = width
        self.isWidthConstrained = true
        self.height = height
        self.isHeightConstrained = true
    }
    
    /// [Internal]
    init(oldConfiguration: DefinedViewConfiguration,
         width: CGFloat? = nil,
         height: CGFloat? = nil) {
        self.inactive = oldConfiguration.inactive // this value may NOT be changed during copying.
        self.width = width ?? oldConfiguration.width
        self.isWidthConstrained = oldConfiguration.isWidthConstrained || width != nil
        self.height = height ?? oldConfiguration.height
        self.isHeightConstrained = oldConfiguration.isHeightConstrained || height != nil
    }
}
