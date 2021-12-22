import SwiftUI

extension DefinedText {
    /// [DE] Set the content color pattern for current root view.
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
    public func contentColor(
        default: Color? = nil,
        loading: Color? = nil,
        active: Color? = nil,
        done: Color? = nil,
        error: Color? = nil,
        disabled: Color? = nil
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewContentColorPatternModifier(
            default: `default`,
            loading: loading,
            active: active,
            done: done,
            error: error,
            disabled: disabled
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedText {
    /// [DE] Set the content color pattern for current root view.
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
    public func contentColor(
        default: Color? = nil,
        loading: Color? = nil,
        active: Color? = nil,
        done: Color? = nil,
        error: Color? = nil,
        disabled: Color? = nil
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewContentColorPatternModifier(
            default: `default`,
            loading: loading,
            active: active,
            done: done,
            error: error,
            disabled: disabled
        ).modify(view: self)
    }
}

extension DefinedViewContentColorPatternModifier {
    func modify(
        view: DefinedText
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedText(
            originalView: view,
            textColor_def: self.default,
            textColor_loading: self.loading,
            textColor_act: self.active,
            textColor_done: self.done,
            textColor_error: self.error,
            textColor_disabled: self.disabled
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: .init(),
            content: { root in
                root
            }
        )
    }
    
    func modify(
        view: DefinedViewModifiedView<DefinedText>
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedViewModifiedView correctly!")
        
        let newRootView = DefinedText(
            originalView: view.root,
            textColor_def: self.default,
            textColor_loading: self.loading,
            textColor_act: self.active,
            textColor_done: self.done,
            textColor_error: self.error,
            textColor_disabled: self.disabled
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
