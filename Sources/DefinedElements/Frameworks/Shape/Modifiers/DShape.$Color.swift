import SwiftUI

extension DefinedShape {
    /// [DE]
    public func shapeColor(
        _ color: Color
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedShapeColorModifier(
            color: color
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedShape {
    /// [DE]
    public func shapeColor(
        _ color: Color
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedShapeColorModifier(
            color: color
        ).modify(view: self)
    }
}

struct DefinedShapeColorModifier : DefinedViewModifier {
    var name: String = "ShapeColor"
    
    var color: Color?
    
    init(color: Color? = nil) {
        self.color = color
    }
    
    func modify(
        view: DefinedShape
    ) -> DefinedViewModifiedView<DefinedShape> {
        print("YES: Modify \(name) for DefinedShape correctly!")
        
        let newRootView = DefinedShape(
            originalView: view,
            shapeColor: self.color
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
            shapeColor: self.color
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
