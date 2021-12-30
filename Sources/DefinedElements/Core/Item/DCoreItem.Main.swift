import SwiftUI

/// [DE] The item object for `DefinedCoreTab`.
///
/// It is designed for `DefinedCoreTab` only.
///
/// - TODO: Documentation.
public struct DefinedCoreItem: View {
    private let NAVI_ICON_SIZE: CGFloat = 34
    private let NAVI_ICON_PADDING: CGFloat = 6
    
    private var content: AnyView? = nil
        
    ///
    private var image: (String, String)? = nil
    
    ///
    private var text: (String, String)? = nil
    
    ///
    private var action: () -> Void
        
    ///
    var linked: DefinedCorePage
    
    ///
    public init(
        _ itemImage: (String, String),
        action: @escaping () -> Void = {},
        page: DefinedCorePage
    ) {
        self.action = action
        self.linked = page
        self.image = itemImage
    }
    
    ///
    public init(
        text itemText: (String, String),
        action: @escaping () -> Void = {},
        page: DefinedCorePage
    ) {
        self.action = action
        self.linked = page
        self.text = itemText
    }
    
    ///
    public init(
        text itemText: String,
        action: @escaping () -> Void = {},
        page: DefinedCorePage
    ) {
        self.action = action
        self.linked = page
        self.text = (itemText, itemText)
    }
    
    ///
    public init<Content: View>(
        action: @escaping () -> Void = {},
        page: DefinedCorePage,
        @ViewBuilder _ content: @escaping () -> Content? = { return nil }
    ) {
        self.action = action
        self.linked = page
        self.content = AnyView(content())
    }
    
    public var body: some View {
        EmptyView()
        // It is for filling up the View requirement.
        // No actual view.
    }
    
    /// [DE Internal]
    internal func build(indicator: Binding<String?>) -> some View {
        if (image != nil) {
            return DefinedCoreTabView(
                image: self.image!,
                action: self.action,
                indicator: indicator,
                page: self.linked
            )
        } else if (text != nil) {
            return DefinedCoreTabView(
                text: self.text!,
                action: self.action,
                indicator: indicator,
                page: self.linked
            )
        } else {
            return DefinedCoreTabView(
                self.content,
                action: self.action,
                indicator: indicator,
                page: self.linked
            )
        }
    }
}
