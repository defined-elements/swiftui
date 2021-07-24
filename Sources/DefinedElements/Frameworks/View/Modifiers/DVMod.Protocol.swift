import SwiftUI

/// [DE] A modifier for `DefinedView`.
///
/// It supports basic SwiftUI `View` as well.
///
/// =====
///
/// **Why do we need to extend among `View`, `DefinedView`, and `DefinedViewModifiedView`?**
///
/// Because when we have a `DefinedViewModifiedView` with an invalid Modifier,
/// we are still able to keep the origin ancestor and pass it through.
///
/// If we shut down the Modifier pattern by only extending the `View`,
/// we will lose all future changes.
///
/// =====
///
/// **What do I need to implement?**
///
/// ``` swift
/// extension View {
///     public func yourFunctionName(_ parameter: YourParameter) -> some View {
///         return DefinedViewSomeModifier(parameter: YourParameter).modify(view: self)
///     }
/// }
///
/// extension DefinedView {
///     public func yourFunctionName(_ parameter: YourParameter) -> some View {
///         return DefinedViewSomeModifier(parameter: YourParameter).modify(view: self)
///     }
/// }
///
/// extension DefinedViewModifiedView {
///     public func yourFunctionName(_ parameter: YourParameter) -> some View {
///         return DefinedViewSomeModifier(parameter: YourParameter).modify(view: self)
///     }
/// }
/// ```
@available(iOS 14.0, macOS 11.0, tvOS 13.0, watchOS 6.0, *)
public protocol DefinedViewModifier {
    /// The brief name for `DefinedViewModifiedView`
    var name: String { get }
}

public extension DefinedViewModifier {
    /// [DE] `An error handling case for `modify(view:)` when we have an undefined `DefinedViewModifiedView`
    ///
    /// - Important: You should NOT use this function directly!
    ///
    /// - Parameter view: A `DefinedViewModifiedView` with unsupported RootViewType.
    /// - Returns: The original `DefinedViewModifiedView` (because we are not able to modify it), nothing changes.
    func modify<OtherModifiedViews: DefinedView>(
        view: DefinedViewModifiedView<OtherModifiedViews>
    ) -> DefinedViewModifiedView<OtherModifiedViews> {
        print("WARNING: Modify [\(name)] for DefinedViewModifiedView (root: \(type(of: view.root))) is not supported!")
        return view
    }
    
    /// [DE] `An error handling case for `modify(view:)` when we have an undefined `DefinedView`
    ///
    /// - Important: You should NOT use this function directly!
    ///
    /// - Parameter view: A `DefinedView`.
    /// - Returns: A `DefinedViewModifiedView` containing this `DefinedView` as a root (because we are not able to modify it).
    func modify<OtherDefinedViews: DefinedView>(
        view: OtherDefinedViews
    ) -> DefinedViewModifiedView<OtherDefinedViews> {
        print("WARNING: Modify [\(name)] for DefinedView (root: \(type(of: view))) is not supported!")
        return DefinedViewModifiedView(root: view, configuration: .init(), content: { root in
            root
        })
    }
    
    /// [DE] `An error handling case for `modify(view:)` when we have a `View`
    ///
    /// A `View` is basically not supported for `DefinedViewModifier`.
    /// If you find out that after previous modifying, it becomes a `View`,
    /// then you should try to debug by looking for return types.
    ///
    /// The modifier should NOT have a return type of `some View`.
    ///
    /// - Important: You should NOT use this function directly!
    ///
    /// - Parameter view: A `View`.
    /// - Returns: The view itself (because we are not able to modify it).
    func modify<OtherViews: View>(
        view: OtherViews
    ) -> some View {
        print("ERROR: Modify [\(name)] for View (type: \(type(of: view))) is not supported!")
        return view
    }
}
