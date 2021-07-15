import SwiftUI

/// [DE Internal] Configuration object for `DefinedViewModifiedView`.
///
/// This class is designed for internal usage only. We do not need this object outside.
///
/// - TODO: convey the shape of ancestors!
internal class DefinedViewModifiedViewConfiguration {
    /// A variable showing if the background of the root view has been set.
    ///
    /// If the background of the root view has been set, we are going into the `forceBackground(_:)` method.
    /// This method wraps the background outside root view instead of setting into the root view.
    var isBackgroundIsolated_def: Bool = false
    
    var isBackgroundIsolated_loading: Bool = false
    
    var isBackgroundIsolated_act: Bool = false
    
    var isBackgroundIsolated_done: Bool = false
    
    var isBackgroundIsolated_error: Bool = false
    
    var isBackgroundIsolated_disabled: Bool = false
    
    ///
    var backgroundConfiguration: DefinedViewBackgroundConfiguration = .init()
    
    ///
    var isBorderIsolated_def: Bool = false
    
    var isBorderIsolated_loading: Bool = false
    
    var isBorderIsolated_act: Bool = false
    
    var isBorderIsolated_done: Bool = false
    
    var isBorderIsolated_error: Bool = false
    
    var isBorderIsolated_disabled: Bool = false
    
    ///
    var borderConfiguration: DefinedViewBorderConfiguration = .init()
    
    /// A variable showing if the frame size of the root view has been set to expand.
    var isFrameSizeSet: (width: Bool, height: Bool) = (width: false, height: false)
    
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
        borderConfiguration: DefinedViewBorderConfiguration? = nil,
        isFrameSizeSet: (width: Bool, height: Bool)? = nil
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
        self.isFrameSizeSet = isFrameSizeSet ?? oldConfiguration.isFrameSizeSet
    }
    
    func backgroundIsolation(
        default def: Bool = false,
        loading: Bool = false,
        active: Bool = false,
        done: Bool = false,
        error: Bool = false,
        disabled: Bool = false
    ) -> DefinedViewModifiedViewConfiguration {
        self.isBackgroundIsolated_def = def ? true : self.isBackgroundIsolated_def
        self.isBackgroundIsolated_loading = loading ? true : self.isBackgroundIsolated_loading
        self.isBackgroundIsolated_act = active ? true : self.isBackgroundIsolated_act
        self.isBackgroundIsolated_done = done ? true : self.isBackgroundIsolated_done
        self.isBackgroundIsolated_error = error ? true : self.isBackgroundIsolated_error
        self.isBackgroundIsolated_disabled = disabled ? true : self.isBackgroundIsolated_disabled
        return self
    }
    
    func setMVBackground(
        default def: AnyView? = nil,
        loading: AnyView? = nil,
        active: AnyView? = nil,
        done: AnyView? = nil,
        error: AnyView? = nil,
        disabled: AnyView? = nil
    ) -> DefinedViewModifiedViewConfiguration {
        self.backgroundConfiguration.background_def = def ?? self.backgroundConfiguration.background_def
        self.backgroundConfiguration.background_loading = loading ?? self.backgroundConfiguration.background_loading
        self.backgroundConfiguration.background_act = active ?? self.backgroundConfiguration.background_act
        self.backgroundConfiguration.background_done = done ?? self.backgroundConfiguration.background_done
        self.backgroundConfiguration.background_def = def ?? self.backgroundConfiguration.background_def
        self.backgroundConfiguration.background_def = def ?? self.backgroundConfiguration.background_def
        return self
    }
    
    func borderIsolation(
        default def: Bool = false,
        loading: Bool = false,
        active: Bool = false,
        done: Bool = false,
        error: Bool = false,
        disabled: Bool = false
    ) -> DefinedViewModifiedViewConfiguration {
        self.isBorderIsolated_def = def ? true : self.isBorderIsolated_def
        self.isBorderIsolated_loading = loading ? true : self.isBorderIsolated_loading
        self.isBorderIsolated_act = active ? true : self.isBorderIsolated_act
        self.isBorderIsolated_done = done ? true : self.isBorderIsolated_done
        self.isBorderIsolated_error = error ? true : self.isBorderIsolated_error
        self.isBorderIsolated_disabled = disabled ? true : self.isBorderIsolated_disabled
        return self
    }
    
    func frameWidthSet() -> DefinedViewModifiedViewConfiguration {
        self.isFrameSizeSet = (width: true, height: self.isFrameSizeSet.height)
        return self
    }
    
    func frameHeightSet() -> DefinedViewModifiedViewConfiguration {
        self.isFrameSizeSet = (width: self.isFrameSizeSet.width, height: true)
        return self
    }
    
    func frameSet() -> DefinedViewModifiedViewConfiguration {
        self.isFrameSizeSet = (width: true, height: true)
        return self
    }
}
