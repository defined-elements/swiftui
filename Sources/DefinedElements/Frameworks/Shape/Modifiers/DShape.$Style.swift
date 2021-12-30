import SwiftUI

extension DefinedShape {
    /// [DE]
    public func style(
        _ style: DefinedShapeStyle
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedShapeStyleModifier(
            style: style
        ).modify(view: self)
    }
}

extension DefinedViewModifiedView where Self.RootViewType == DefinedShape {
    /// [DE]
    public func style(
        _ style: DefinedShapeStyle
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedShapeStyleModifier(
            style: style
        ).modify(view: self)
    }
}

struct DefinedShapeStyleModifier : DefinedViewModifier {
    var name: String = "ShapeStyle"
    
    var style: DefinedShapeStyle?
    
    init(style: DefinedShapeStyle? = nil) {
        self.style = style
    }
    
    func modify(
        view: DefinedShape
    ) -> DefinedViewModifiedView<DefinedShape> {
        print("YES: Modify \(name) for DefinedShape correctly!")
        
        let newRootView = DefinedShape(
            originalView: view,
            shapeStyle: self.style
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
            shapeStyle: self.style
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
