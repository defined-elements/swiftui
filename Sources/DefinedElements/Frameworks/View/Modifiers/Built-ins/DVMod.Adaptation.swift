import SwiftUI

extension DefinedView {
    /// [DE]
    public func adapt<Content: View>(
        _ adaptation: @escaping (AnyView) -> Content
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewAdaptationModifier().modify(
            view: self,
            adaptation: adaptation
        )
    }
}

extension DefinedViewModifiedView {
    /// [DE]
    public func adapt<Content: View>(
        _ adaptation: @escaping (AnyView) -> Content
    ) -> Self {
        return DefinedViewAdaptationModifier().modifyDVMV(
            view: self,
            adaptation: adaptation
        )
    }
}

struct DefinedViewAdaptationModifier : DefinedViewModifier {
    let name: String = "Adaptation"
    
    func modify<OriginalView: DefinedView, Content: View>(
        view: OriginalView,
        adaptation: @escaping (AnyView) -> Content
    ) -> DefinedViewModifiedView<OriginalView> {
        print("YES: Modify \(name) (forcely wrapper) for DefinedView correctly!")
        return DefinedViewModifiedView(
            root: view,
            configuration: .init(),
            content: { root in
                adaptation(AnyView(root))
            }
        )
    }
    
    func modifyDVMV<OriginalView: DefinedView, Content: View>(
        view: DefinedViewModifiedView<OriginalView>,
        adaptation: @escaping (AnyView) -> Content
    ) -> DefinedViewModifiedView<OriginalView> {
        print("YES: Modify \(name) (forcely wrapper) for DefinedViewModifiedView correctly!")
        return DefinedViewModifiedView(
            root: view.root,
            configuration: view.configuration,
            content: { root in
                adaptation(view.content(root))
            }
        )
    }
}
