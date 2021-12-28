import SwiftUI

extension DefinedShape {
    /// [DE]
    public func cornerRadius(
        _ radius: CGFloat
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedShapeRadiusModifier(
            radius: radius
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedShape {
    /// [DE]
    public func cornerRadius(
        _ radius: CGFloat
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedShapeRadiusModifier(
            radius: radius
        ).modify(view: self)
    }
}

struct DefinedShapeRadiusModifier : DefinedViewModifier {
    var name: String = "ShapeRadius"
    
    var radius: CGFloat?
    
    init(radius: CGFloat? = nil) {
        self.radius = radius
    }
    
    func modify(
        view: DefinedShape
    ) -> DefinedViewModifiedView<DefinedShape> {
        print("YES: Modify \(name) for DefinedShape correctly!")
        
        let newRootView = DefinedShape(
            originalView: view,
            radius: self.radius
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
            radius: self.radius
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
