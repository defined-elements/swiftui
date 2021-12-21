import SwiftUI

// MARK: - View

extension View {
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: GeneralStatus,
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: [status],
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(when status: GeneralStatus, _ color: Color) -> some View {
        return DefinedViewBackgroundPatternModifier(status: [status], background: AnyView(color)).modify(view: self)
    }
    
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: GeneralStatusSelector,
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status.getGS(),
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(
        when status: GeneralStatusSelector,
        _ color: Color
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status.getGS(),
            background: AnyView(color)
        ).modify(view: self)
    }
    
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background? (An array containing one or more status you need)
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: [GeneralStatus],
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status,
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background? (An array containing one or more status you need)
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(
        when status: [GeneralStatus],
        _ color: Color
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status,
            background: AnyView(color)
        ).modify(view: self)
    }
}

// MARK: - DefinedView

extension DefinedView {
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: GeneralStatus,
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: [status],
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(when status: GeneralStatus, _ color: Color) -> some View {
        return DefinedViewBackgroundPatternModifier(status: [status], background: AnyView(color)).modify(view: self)
    }
    
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: GeneralStatusSelector,
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status.getGS(),
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(
        when status: GeneralStatusSelector,
        _ color: Color
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status.getGS(),
            background: AnyView(color)
        ).modify(view: self)
    }
    
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background? (An array containing one or more status you need)
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: [GeneralStatus],
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status,
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background? (An array containing one or more status you need)
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(
        when status: [GeneralStatus],
        _ color: Color
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status,
            background: AnyView(color)
        ).modify(view: self)
    }
}

// MARK: - DefinedViewModifiedView

extension DefinedViewModifiedView {
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: GeneralStatus,
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: [status],
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(when status: GeneralStatus, _ color: Color) -> some View {
        return DefinedViewBackgroundPatternModifier(status: [status], background: AnyView(color)).modify(view: self)
    }
    
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: GeneralStatusSelector,
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status.getGS(),
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background?
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(
        when status: GeneralStatusSelector,
        _ color: Color
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status.getGS(),
            background: AnyView(color)
        ).modify(view: self)
    }
    
    /// [DE] Set the background pattern of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background? (An array containing one or more status you need)
    ///   - background: The view that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background<SomeView: View>(
        when status: [GeneralStatus],
        _ background: SomeView
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status,
            background: AnyView(background)
        ).modify(view: self)
    }
    
    /// [DE] Set the background color of current root view with corresponding status.
    ///
    /// - Parameters:
    ///   - when: When will we use this background? (An array containing one or more status you need)
    ///   - color: The color that will be the background when status matches.
    ///
    /// - Returns: A view after modifying the background color pattern of root view.
    ///
    /// - Important: This function may NOT work if you are using me!
    public func background(
        when status: [GeneralStatus],
        _ color: Color
    ) -> some View {
        return DefinedViewBackgroundPatternModifier(
            status: status,
            background: AnyView(color)
        ).modify(view: self)
    }
}

// MARK: - Modifier

struct DefinedViewBackgroundPatternModifier : DefinedViewModifier {
    var name: String = "BackgroundPattern"
    
    var `default`: AnyView?
    var loading: AnyView?
    var active: AnyView?
    var done: AnyView?
    var error: AnyView?
    var disabled: AnyView?
    
    init(
        default: AnyView? = nil,
        loading: AnyView? = nil,
        active: AnyView? = nil,
        done: AnyView? = nil,
        error: AnyView? = nil,
        disabled: AnyView? = nil
    ) {
        self.default = `default`
        self.loading = loading
        self.active = active
        self.done = done
        self.error = error
        self.disabled = disabled
    }
    
    ///
    init(status: [GeneralStatus], background: AnyView) {
        self.default = status.contains(.default) ? background : nil
        self.loading = status.contains(.loading) ? background : nil
        self.active = status.contains(.active) ? background : nil
        self.done = status.contains(.done) ? background : nil
        self.error = status.contains(.error) ? background : nil
        self.disabled = status.contains(.disabled) ? background : nil
    }

    func modify<OtherModifiedViews: DefinedView>(view: DefinedViewModifiedView<OtherModifiedViews>) -> DefinedViewModifiedView<OtherModifiedViews> {
        // we allow `default` to be set when this `DefinedView` does not support `DefinedViewBackgroundConfiguration` stuff.
        return self.default != nil ? forceBackground(view: view) : view
    }
    
    func forceBackground<OtherModifiedViews: DefinedView>(view: DefinedViewModifiedView<OtherModifiedViews>) -> DefinedViewModifiedView<OtherModifiedViews> {
        print("YES: Modify \(name) (forcely wrapper) for DefinedViewModifiedView correctly!")
        return DefinedViewModifiedView(root: view.root, configuration: view.configuration, content: { root in
            view.content(root)
                .background(self.default)
        })
    }
}
