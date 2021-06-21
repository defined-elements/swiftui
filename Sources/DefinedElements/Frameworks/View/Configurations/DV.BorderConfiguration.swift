import Foundation
import SwiftUI

/// [DE] A configuration class containing everything related to border working for `DefinedView` protocol system.
///
/// - TODO: convert class into struct
public class DefinedViewBorderConfiguration {
    /// A boolean representing if this view is using `BorderConfiguration`.
    ///
    /// - Important:
    ///   This variable should not be changed!
    var inactive: Bool
    
    ///
    var isColorSet_def: Bool = false
    
    ///
    var isColorSet_loading: Bool = false
    
    ///
    var isColorSet_act: Bool = false
    
    ///
    var isColorSet_done: Bool = false
    
    ///
    var isColorSet_error: Bool = false
    
    ///
    var isColorSet_disabled: Bool = false
    
    ///
    var isWidthSet_def: Bool = false
    
    ///
    var isWidthSet_loading: Bool = false
    
    ///
    var isWidthSet_act: Bool = false
    
    ///
    var isWidthSet_done: Bool = false
    
    ///
    var isWidthSet_error: Bool = false
    
    ///
    var isWidthSet_disabled: Bool = false
    
    ///
    var borderColor_def: Color
    
    ///
    var borderColor_loading: Color
    
    ///
    var borderColor_act: Color
    
    ///
    var borderColor_done: Color
    
    ///
    var borderColor_error: Color
    
    ///
    var borderColor_disabled: Color
    
    ///
    var borderWidth_def: CGFloat
    
    ///
    var borderWidth_loading: CGFloat
    
    ///
    var borderWidth_act: CGFloat
    
    ///
    var borderWidth_done: CGFloat
    
    ///
    var borderWidth_error: CGFloat
    
    ///
    var borderWidth_disabled: CGFloat
    
    /// [DE Internal]
    public init(inactive: Bool) {
        self.inactive = inactive
    }
    
    /// [DE]
    public init(
        default def: (color: Color, width: CGFloat) = (color: Color.clear, width: 1),
        loading: (color: Color, width: CGFloat) = (color: Color.clear, width: 1),
        active act: (color: Color, width: CGFloat) = (color: Color.clear, width: 3),
        done: (color: Color, width: CGFloat) = (color: Color.clear, width: 1),
        error: (color: Color, width: CGFloat) = (color: Color.clear, width: 2),
        disabled: (color: Color, width: CGFloat) = (color: Color.clear, width: 1)
    ) {
        self.inactive = false
        self.borderColor_def = def.color
        self.borderColor_loading = loading.color
        self.borderColor_act = act.color
        self.borderColor_done = done.color
        self.borderColor_error = error.color
        self.borderColor_disabled = disabled.color
        self.borderWidth_def = def.width
        self.borderWidth_loading = loading.width
        self.borderWidth_act = act.width
        self.borderWidth_done = done.width
        self.borderWidth_error = error.width
        self.borderWidth_disabled = disabled.width
    }
    
    // MARK: - Modifier Constructor
    
    /// [Internal]
    init(
        oldConfiguration: DefinedViewBorderConfiguration,
        isColorSet_def: Bool? = nil,
        isColorSet_loading: Bool? = nil,
        isColorSet_act: Bool? = nil,
        isColorSet_done: Bool? = nil,
        isColorSet_error: Bool? = nil,
        isColorSet_disabled: Bool? = nil,
        isWidthSet_def: Bool? = nil,
        isWidthSet_loading: Bool? = nil,
        isWidthSet_act: Bool? = nil,
        isWidthSet_done: Bool? = nil,
        isWidthSet_error: Bool? = nil,
        isWidthSet_disabled: Bool? = nil,
        borderColor_def: Color? = nil,
        borderColor_loading: Color? = nil,
        borderColor_act: Color? = nil,
        borderColor_done: Color? = nil,
        borderColor_error: Color? = nil,
        borderColor_disabled: Color? = nil,
        borderWidth_def: CGFloat? = nil,
        borderWidth_loading: CGFloat? = nil,
        borderWidth_act: CGFloat? = nil,
        borderWidth_done: CGFloat? = nil,
        borderWidth_error: CGFloat? = nil,
        borderWidth_disabled: CGFloat? = nil
    ) {
        self.inactive = oldConfiguration.inactive // this value does not support changing
        self.isColorSet_def = isColorSet_def ?? oldConfiguration.isColorSet_def
        self.isColorSet_loading = isColorSet_loading ?? oldConfiguration.isColorSet_loading
        self.isColorSet_act = isColorSet_act ?? oldConfiguration.isColorSet_act
        self.isColorSet_done = isColorSet_done ?? oldConfiguration.isColorSet_done
        self.isColorSet_error = isColorSet_error ?? oldConfiguration.isColorSet_error
        self.isColorSet_disabled = isColorSet_disabled ?? oldConfiguration.isColorSet_disabled
        self.isWidthSet_def = isWidthSet_def ?? oldConfiguration.isWidthSet_def
        self.isWidthSet_loading = isWidthSet_loading ?? oldConfiguration.isWidthSet_loading
        self.isWidthSet_act = isWidthSet_act ?? oldConfiguration.isWidthSet_act
        self.isWidthSet_done = isWidthSet_done ?? oldConfiguration.isWidthSet_done
        self.isWidthSet_error = isWidthSet_error ?? oldConfiguration.isWidthSet_error
        self.isWidthSet_disabled = isWidthSet_disabled ?? oldConfiguration.isWidthSet_disabled
        
        self.borderColor_def = borderColor_def ?? oldConfiguration.borderColor_def
        if borderColor_def != nil {
            self.isColorSet_def = true
        }
        
        self.borderColor_loading = borderColor_loading ?? oldConfiguration.borderColor_loading
        if borderColor_loading != nil {
            self.isColorSet_loading = true
        }
        
        self.borderColor_act = borderColor_act ?? oldConfiguration.borderColor_act
        if borderColor_act != nil {
            self.isColorSet_act = true
        }
        
        self.borderColor_done = borderColor_done ?? oldConfiguration.borderColor_done
        if borderColor_done != nil {
            self.isColorSet_done = true
        }
        
        self.borderColor_error = borderColor_error ?? oldConfiguration.borderColor_error
        if borderColor_error != nil {
            self.isColorSet_error = true
        }
        
        self.borderColor_disabled = borderColor_disabled ?? oldConfiguration.borderColor_disabled
        if borderColor_disabled != nil {
            self.isColorSet_disabled = true
        }
        
        self.borderWidth_def = borderWidth_def ?? oldConfiguration.borderWidth_def
        if borderWidth_def != nil {
            self.isWidthSet_def = true
        }
        
        self.borderWidth_loading = borderWidth_loading ?? oldConfiguration.borderWidth_loading
        if borderWidth_loading != nil {
            self.isWidthSet_loading = true
        }
        
        self.borderWidth_act = borderWidth_act ?? oldConfiguration.borderWidth_act
        if borderWidth_act != nil {
            self.isWidthSet_act = true
        }
        
        self.borderWidth_done = borderWidth_done ?? oldConfiguration.borderWidth_done
        if borderWidth_done != nil {
            self.isWidthSet_done = true
        }
        
        self.borderWidth_error = borderWidth_error ?? oldConfiguration.borderWidth_error
        if borderWidth_error != nil {
            self.isWidthSet_error = true
        }
        
        self.borderWidth_disabled = borderWidth_disabled ?? oldConfiguration.borderWidth_disabled
        if borderWidth_disabled != nil {
            self.isWidthSet_disabled = true
        }
    }
}
