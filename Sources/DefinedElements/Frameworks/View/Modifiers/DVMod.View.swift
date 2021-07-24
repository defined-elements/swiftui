import SwiftUI

/// [DE Internal] A view contains the modified content from `DefinedViewModifier`.
///
/// It is accessible from outside, but it is NOT designed to be initialized by yourself.
/// The only purpose of it is to hold the view and Modifier pattern on `DefinedViewModifier` design pattern.
///
/// - Note: It only supports `DefinedView` as its root.
///   So if you want to get the benefits from it, you have to follow the design pattern of `DefinedView`.
public struct DefinedViewModifiedView<Root> : DefinedView where Root: DefinedView {
    /// A type containing the RootView of this `DefinedViewModifiedView`.
    ///
    /// It is generally made for filtering `DefinedView`,
    /// when your `DefinedViewModifier` is designed for some specific root views.
    public typealias RootViewType = Root
    
    /// A variable containing the root view itself.
    internal(set) public var root: Root
    
    /// A configuration object storing all needed configurations for `DefinedViewModifiedView`.
    internal var configuration: DefinedViewModifiedViewConfiguration
    
    /// A function containing the build process for view hierarchy.
    internal(set) public var content: (Root) -> AnyView
    
    /// [DE Internal] A constructor taking the `(Root) -> AnyView` function from another `DefinedViewModifiedView`.
    ///
    /// - Note: This constructor is not accessible from outside.
    ///
    /// - Parameters:
    ///   - root: The root view of Modifier design pattern. Should conform to `DefinedView`.
    ///   - content: The content builder function from another `DefinedViewModifiedView`.
    internal init(
        root: Root,
        configuration: DefinedViewModifiedViewConfiguration,
        @ViewBuilder content: @escaping (Root) -> AnyView
    ) {
        self.root = root
        self.configuration = configuration
        self.content = content
    }
    
    /// [DE Internal] A constructor building for another modified level at `DefinedViewModifier` design pattern.
    ///
    /// - Note: This constructor is not accessible from outside.
    ///
    /// - Parameters:
    ///   - root: The root view of Modifier design pattern. Should conform to `DefinedView`.
    ///   - content: The ViewBuilder function building the content in View hierarchy.
    internal init<Content>(
        root: Root,
        configuration: DefinedViewModifiedViewConfiguration,
        @ViewBuilder content: @escaping (Root) -> Content
    ) where Content: View {
        self.root = root
        self.configuration = configuration
        self.content = { root in
            AnyView(content(root))
        }
    }
    
    /// The main body for `DefinedViewModifiedView`.
    public var body: some View {
        self.content(root)
    }
}
