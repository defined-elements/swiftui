import SwiftUI

extension DefinedText {
    /// [DE] Set the text color for current root view.
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func textColor(
        _ color: Color
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextColorModifier(
            color: color
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedText {
    /// [DE] Set the text color for current root view.
    ///
    /// - Parameter color: A color that is going to be set onto the text of root view.
    /// - Returns: A view after modifying the text color of root view.
    public func textColor(
        _ color: Color
    ) -> DefinedViewModifiedView<DefinedText> {
        return DefinedViewTextColorModifier(
            color: color
        ).modify(view: self)
    }
}

extension DefinedViewTextColorModifier {
    func modify(
        view: DefinedText
    ) -> DefinedViewModifiedView<DefinedText> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedText(
            originalView: view,
            textColor_def: color
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
            textColor_def: color
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
