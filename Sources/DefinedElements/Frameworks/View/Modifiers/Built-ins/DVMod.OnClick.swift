import SwiftUI

extension View {
    /// [DE]
    public func onClick(
        _ action: @escaping () -> Void
    ) -> some View {
        return DefinedViewOnClickModifier(
            action: action
        ).modify(view: self)
    }
}

extension DefinedView {
    /// [DE]
    public func onClick(
        _ action: @escaping () -> Void
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewOnClickModifier(
            action: action
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView {
    /// [DE]
    public func onClick(
        _ action: @escaping () -> Void
    ) -> Self {
        return DefinedViewOnClickModifier(
            action: action
        ).modifyDVMV(view: self)
    }
}

struct DefinedViewOnClickModifier : DefinedViewModifier {
    let name: String = "OnClick"
    
    var action: () -> Void
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    func modify<OtherModifiedViews: DefinedView>(
        view: OtherModifiedViews
    ) -> DefinedViewModifiedView<OtherModifiedViews> {
        print("YES: Modify \(name) (forcely wrapper) for DefinedView correctly!")
        return DefinedViewModifiedView(
            root: view,
            configuration: .init(),
            content: { root in
                root
                    .onTapGesture {
                        self.action()
                    }
            }
        )
    }
    
    func modifyDVMV<OtherModifiedViews: DefinedView>(
        view: DefinedViewModifiedView<OtherModifiedViews>
    ) -> DefinedViewModifiedView<OtherModifiedViews> {
        print("YES: Modify \(name) (forcely wrapper) for DefinedViewModifiedView correctly!")
        return DefinedViewModifiedView(
            root: view.root,
            configuration: view.configuration,
            content: { root in
                view.content(root)
                    .onTapGesture {
                        self.action()
                    }
            }
        )
    }
}
