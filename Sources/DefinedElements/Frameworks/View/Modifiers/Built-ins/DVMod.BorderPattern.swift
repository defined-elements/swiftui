import SwiftUI

extension View {
    /// [DE] Set the border pattern for current root view.
    ///
    /// You only need to set the status that you need.
    ///
    /// - Parameter default: The border when status is `default`.
    /// - Parameter loading: The border when status is `loading`.
    /// - Parameter active: The border when status is `active`.
    /// - Parameter done: The border when status is `done`.
    /// - Parameter error: The border when status is `error`.
    /// - Parameter disabled: The border when status is `disabled`.
    /// - Returns: A view after modifying the border pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func border(
        default: DefinedBorder? = nil,
        loading: DefinedBorder? = nil,
        active: DefinedBorder? = nil,
        done: DefinedBorder? = nil,
        error: DefinedBorder? = nil,
        disabled: DefinedBorder? = nil
    ) -> some View {
        return DefinedViewBorderPatternModifier(
            default: `default`,
            loading: loading,
            active: active,
            done: done,
            error: error,
            disabled: disabled
        ).modify(view: self)
    }
}

extension DefinedView {
    /// [DE] Set the border pattern for current root view.
    ///
    /// You only need to set the status that you need.
    ///
    /// - Parameter default: The border when status is `default`.
    /// - Parameter loading: The border when status is `loading`.
    /// - Parameter active: The border when status is `active`.
    /// - Parameter done: The border when status is `done`.
    /// - Parameter error: The border when status is `error`.
    /// - Parameter disabled: The border when status is `disabled`.
    /// - Returns: A view after modifying the border pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func border(
        default: DefinedBorder? = nil,
        loading: DefinedBorder? = nil,
        active: DefinedBorder? = nil,
        done: DefinedBorder? = nil,
        error: DefinedBorder? = nil,
        disabled: DefinedBorder? = nil
    ) -> some View {
        return DefinedViewBorderPatternModifier(
            default: `default`,
            loading: loading,
            active: active,
            done: done,
            error: error,
            disabled: disabled
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE] Set the border pattern for current root view.
    ///
    /// You only need to set the status that you need.
    ///
    /// - Parameter default: The border when status is `default`.
    /// - Parameter loading: The border when status is `loading`.
    /// - Parameter active: The border when status is `active`.
    /// - Parameter done: The border when status is `done`.
    /// - Parameter error: The border when status is `error`.
    /// - Parameter disabled: The border when status is `disabled`.
    /// - Returns: A view after modifying the border pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func border(
        default: DefinedBorder? = nil,
        loading: DefinedBorder? = nil,
        active: DefinedBorder? = nil,
        done: DefinedBorder? = nil,
        error: DefinedBorder? = nil,
        disabled: DefinedBorder? = nil
    ) -> some View {
        return DefinedViewBorderPatternModifier(
            default: `default`,
            loading: loading,
            active: active,
            done: done,
            error: error,
            disabled: disabled
        ).modify(view: self)
    }
}

struct DefinedViewBorderPatternModifier : DefinedViewModifier {
    var name: String = "BorderPattern"
    
    var `default`: DefinedBorder?
    var loading: DefinedBorder?
    var active: DefinedBorder?
    var done: DefinedBorder?
    var error: DefinedBorder?
    var disabled: DefinedBorder?
    
    init(default def: DefinedBorder? = nil,
         loading: DefinedBorder? = nil,
         active: DefinedBorder? = nil,
         done: DefinedBorder? = nil,
         error: DefinedBorder? = nil,
         disabled: DefinedBorder? = nil) {
        self.default = def
        self.loading = loading
        self.active = active
        self.done = done
        self.error = error
        self.disabled = disabled
    }
}
