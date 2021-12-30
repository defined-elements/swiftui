import SwiftUI

extension DefinedButton {
    /// [DE] Set the content color for current root view.
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func contentColor(
        _ color: Color
    ) -> DefinedViewModifiedView<DefinedButton> {
        return DefinedViewContentColorModifier(
            color: color
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedButton {
    /// [DE] Set the content color for current root view.
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func contentColor(
        _ color: Color
    ) -> DefinedViewModifiedView<DefinedButton> {
        return DefinedViewContentColorModifier(
            color: color
        ).modify(view: self)
    }
}

extension DefinedViewContentColorModifier {
    func modify(
        view: DefinedButton
    ) -> DefinedViewModifiedView<DefinedButton> {
        print("YES: Modify \(name) for DefinedButton correctly!")
        
        let newRootView = DefinedButton(
            originalView: view,
            textColor_def: self.color,
            textColor_loading: self.color,
            textColor_act: self.color,
            textColor_done: self.color,
            textColor_error: self.color,
            textColor_disabled: self.color
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
        view: DefinedViewModifiedView<DefinedButton>
    ) -> DefinedViewModifiedView<DefinedButton> {
        print("YES: Modify \(name) for DefinedViewModifiedView correctly!")
        
        let newRootView = DefinedButton(
            originalView: view.root,
            textColor_def: self.color,
            textColor_loading: self.color,
            textColor_act: self.color,
            textColor_done: self.color,
            textColor_error: self.color,
            textColor_disabled: self.color
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
