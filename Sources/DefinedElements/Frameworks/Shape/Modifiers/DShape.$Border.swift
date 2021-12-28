import SwiftUI

extension DefinedShape {
    /// [DE]
    public func border(
        _ border: DefinedBorder
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedViewBorderModifier(
            border: border
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedShape {
    /// [DE]
    public func border(
        _ border: DefinedBorder
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedViewBorderModifier(
            border: border
        ).modify(view: self)
    }
}

extension DefinedViewBorderModifier {
    func modify(
        view: DefinedShape
    ) -> DefinedViewModifiedView<DefinedShape> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedShape(
            originalView: view,
            borderConfiguration: .init(
                default: self.border,
                loading: self.border,
                active: self.border,
                done: self.border,
                error: self.border,
                disabled: self.border
            )
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
        view: DefinedViewModifiedView<DefinedShape>
    ) -> DefinedViewModifiedView<DefinedShape> {
        print("YES: Modify \(name) for DefinedViewModifiedView correctly!")
        
        let newRootView = DefinedShape(
            originalView: view.root,
            borderConfiguration: .init(
                default: self.border,
                loading: self.border,
                active: self.border,
                done: self.border,
                error: self.border,
                disabled: self.border
            )
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
