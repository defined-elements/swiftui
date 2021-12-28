import SwiftUI

extension DefinedShape {
    /// [DE]
    public func contentClipped(
        _ clipped: Bool
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedShapeContentClippedModifier(
            clipped: clipped
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedShape {
    /// [DE]
    public func contentClipped(
        _ clipped: Bool
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedShapeContentClippedModifier(
            clipped: clipped
        ).modify(view: self)
    }
}

struct DefinedShapeContentClippedModifier : DefinedViewModifier {
    var name: String = "ShapeContentClipped"
    
    var clipped: Bool?
    
    init(clipped: Bool? = nil) {
        self.clipped = clipped
    }
    
    func modify(
        view: DefinedShape
    ) -> DefinedViewModifiedView<DefinedShape> {
        print("YES: Modify \(name) for DefinedShape correctly!")
        
        let newRootView = DefinedShape(
            originalView: view,
            contentClipped: self.clipped
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
            contentClipped: self.clipped
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
