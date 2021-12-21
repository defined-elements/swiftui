import SwiftUI

extension View {
    /// [DE] Set the text color pattern for current root view.
    ///
    /// You only need to set the colors of status that you need.
    ///
    /// - Parameter default: The color when status is `default`.
    /// - Parameter loading: The color when status is `loading`.
    /// - Parameter active: The color when status is `active`.
    /// - Parameter done: The color when status is `done`.
    /// - Parameter error: The color when status is `error`.
    /// - Parameter disabled: The color when status is `disabled`.
    /// - Returns: A view after modifying the text color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func textColor(default: Color? = nil, loading: Color? = nil, active: Color? = nil,
                          done: Color? = nil, error: Color? = nil, disabled: Color? = nil) -> some View {
        return DefinedViewTextColorPatternModifier(default: `default`,
                                                   loading: loading,
                                                   active: active,
                                                   done: done,
                                                   error: error,
                                                   disabled: disabled).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the text color pattern for current root view.
    ///
    /// You only need to set the colors of status that you need.
    ///
    /// - Parameter default: The color when status is `default`.
    /// - Parameter loading: The color when status is `loading`.
    /// - Parameter active: The color when status is `active`.
    /// - Parameter done: The color when status is `done`.
    /// - Parameter error: The color when status is `error`.
    /// - Parameter disabled: The color when status is `disabled`.
    /// - Returns: A view after modifying the text color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func textColor(default: Color? = nil, loading: Color? = nil, active: Color? = nil,
                          done: Color? = nil, error: Color? = nil, disabled: Color? = nil) -> some View {
        return DefinedViewTextColorPatternModifier(default: `default`,
                                                   loading: loading,
                                                   active: active,
                                                   done: done,
                                                   error: error,
                                                   disabled: disabled).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the text color pattern for current root view.
    ///
    /// You only need to set the colors of status that you need.
    ///
    /// - Parameter default: The color when status is `default`.
    /// - Parameter loading: The color when status is `loading`.
    /// - Parameter active: The color when status is `active`.
    /// - Parameter done: The color when status is `done`.
    /// - Parameter error: The color when status is `error`.
    /// - Parameter disabled: The color when status is `disabled`.
    /// - Returns: A view after modifying the text color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func textColor(default: Color? = nil, loading: Color? = nil, active: Color? = nil,
                          done: Color? = nil, error: Color? = nil, disabled: Color? = nil) -> some View {
        return DefinedViewTextColorPatternModifier(default: `default`,
                                                   loading: loading,
                                                   active: active,
                                                   done: done,
                                                   error: error,
                                                   disabled: disabled).modify(view: self)
    }
}

struct DefinedViewTextColorPatternModifier : DefinedViewModifier {
    let name: String = "TextColorPattern"
    
    var `default`: Color?
    var loading: Color?
    var active: Color?
    var done: Color?
    var error: Color?
    var disabled: Color?
    
    init(default def: Color? = nil,
         loading: Color? = nil,
         active: Color? = nil,
         done: Color? = nil,
         error: Color? = nil,
         disabled: Color? = nil) {
        self.default = def
        self.loading = loading
        self.active = active
        self.done = done
        self.error = error
        self.disabled = disabled
    }
}
