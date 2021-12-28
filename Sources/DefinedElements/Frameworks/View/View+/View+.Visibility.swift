import SwiftUI

/// Currently, I am not sure about the differences between official `hidden()` function and `opacity()` function. So I cannot guarantee that the view will not be rendered in the back scene when it has been updated.
///
/// But after hiding the view in this way, I can guarantee that the focus will never be catched. That is the current goal, and we have done that perfectly.
extension View {
    /// [DE] Hide the view dynamically.
    ///
    /// **Example**
    /// - Just hide it.
    ///
    ///       Text(...)
    ///           .hidden(hide: true)
    ///
    /// - Dynamically hide it.
    ///
    ///       Text(...)
    ///           .hidden(hide: a_dynamic_state_boolean)
    ///
    /// - Warning: Hiding a view (before DE v0.1) is only hiding it rather than stop rendering it. It may be rendered in the back scene even when it is hidden. So please take care of the performance before we come up with a better solution.
    ///
    /// - Parameter hide: Should it be hidden?
    public func visibility(hide shouldHide: Bool) -> some View {
        self.opacity(shouldHide ? 0 : 1)
    }
    
    /// [DE] Hide the view dynamically.
    ///
    /// This function determines when it should be shown.
    ///
    /// **Example**
    /// - Just hide it.
    ///
    ///       Text(...)
    ///           .hidden(show: false)
    ///
    /// - Dynamically hide it.
    ///
    ///       Text(...)
    ///           .hidden(show: a_dynamic_state_boolean)
    ///
    /// - Warning: Hiding a view (before DE v0.1) is only hiding it rather than stop rendering it. It may be rendered in the back scene even when it is hidden. So please take care of the performance before we come up with a better solution.
    ///
    /// - Parameter show: Should it be shown?
    public func visibility(show shouldShow: Bool) -> some View {
        return self.opacity(shouldShow ? 1 : 0)
    }
}
