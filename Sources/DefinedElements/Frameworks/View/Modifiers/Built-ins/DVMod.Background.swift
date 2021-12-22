import SwiftUI

extension View {
    /// Since we have `background(_:)` method in SwiftUI,
    /// we do not implement the default method for `View`.
}

extension DefinedView {
    /// Since we have `background(_:)` method in SwiftUI,
    /// we do not implement the default method for other unsupported `DefinedView`.
}

extension DefinedViewModifiedView {
    /// [DE] Set the background of current root view.
    ///
    /// - Parameter background: The background of view.
    /// - Returns: A view after modifying the background of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(_ background: SomeView) -> some View {
        return DefinedViewBackgroundModifier(background: AnyView(background)).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view.
    ///
    /// - Parameter background: The background color of view.
    /// - Returns: A view after modifying the background color of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(_ color: Color) -> some View {
        return DefinedViewBackgroundModifier(background: AnyView(color)).modify(view: self)
    }
}

struct DefinedViewBackgroundModifier : DefinedViewModifier {
    var name: String = "Background"
    
    var background: AnyView
    
    init(background: AnyView) {
        self.background = background
    }

    func modify<OtherModifiedViews: DefinedView>(view: DefinedViewModifiedView<OtherModifiedViews>) -> DefinedViewModifiedView<OtherModifiedViews> {
        return forceBackground(view: view)
    }
    
    func forceBackground<OtherModifiedViews: DefinedView>(view: DefinedViewModifiedView<OtherModifiedViews>) -> DefinedViewModifiedView<OtherModifiedViews> {
        print("YES: Modify \(name) (forcely wrapper) for DefinedViewModifiedView correctly!")
        return DefinedViewModifiedView(root: view.root, configuration: view.configuration, content: { root in
            view.content(root)
                .background(self.background)
        })
    }
}
