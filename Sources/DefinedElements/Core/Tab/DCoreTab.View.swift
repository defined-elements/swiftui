import SwiftUI

/// [DE Internal] The internal View component using for `DefinedCoreTab` module.
///
/// We use it to render the Core Tab Button and keep the state at the same time.
/// If we choose to use a render function, it might not be able to render dynamically.
internal struct DefinedCoreTabView : View {
    
    private let NAVI_ICON_SIZE: CGFloat = 34
    private let NAVI_ICON_PADDING: CGFloat = 2
    
    private let NAVI_ANIMATION_INTERVAL: Double = 0.18
    
    /// [DE Internal] It is an outside indicator binding that represents the tag of the current selected page.
    @Binding var indicator: String?
    
    /// [DE Private] The button content as a view.
    private var content: AnyView? = nil
    
    /// [DE Private] The button content as an image.
    ///
    /// It can also be used when it is a button mixing image and text.
    private var image: (String, String)? = nil
    
    /// [DE Private] The button content as a text.
    ///
    /// It can also be used when it is a button mixing image and text.
    private var text: (String, String)? = nil
    
    /// [DE Private] The clicking action of the button.
    private var action: () -> Void
    
    /// [DE Internal] The linked core page of this button.
    var linked: DefinedCorePage
    
    ///
    init(
        _ content: AnyView? = nil,
        text itemText: (String, String)? = nil,
        image itemImage: (String, String)? = nil,
        action itemAction: @escaping () -> Void = {},
        indicator: Binding<String?>,
        page: DefinedCorePage
    ) {
        self._indicator = indicator
        self.text = itemText
        self.image = itemImage
        self.action = itemAction
        self.linked = page
        self.content = content
    }
    
    /// - TODO: 按钮的特殊状态。
    /// - TODO: 图标宽度做 iPad 和 macOS 的适配。
    public var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: self.NAVI_ANIMATION_INTERVAL)) {
                self.indicator = self.linked.tag
            }
            self.action()
        }){
            VStack(alignment: .center, spacing: 0) {
                if (self.image != nil) {
                    getIconByImage(self.image!, indicator: self.$indicator)
                } else if (self.text != nil) {
                    getIconByText(self.text!, indicator: self.$indicator)
                } else {
                    self.content
                }
            }
            .frame(maxWidth: 46, maxHeight: .infinity)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func getIconByImage(
        _ image: (String, String),
        indicator: Binding<String?>
    ) -> some View {
        let (activeIcon, defaultIcon) = image
        var curr: some View {
            Image(self.indicator == self.linked.tag ? activeIcon : defaultIcon)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: NAVI_ICON_SIZE, maxHeight: NAVI_ICON_SIZE, alignment: .center)
                .padding(NAVI_ICON_PADDING)
        }
        return curr
    }
    
    private func getIconByText(
        _ text: (String, String),
        indicator: Binding<String?>
    ) -> some View {
        let (activeText, defaultText) = text
        var curr: some View {
            VStack(alignment: .center, spacing: 7) {
                DefinedText(self.indicator == self.linked.tag ? activeText : defaultText)
                    .preset(.emph(.content))
                    .contentColor(self.indicator == self.linked.tag ? DEColor.main.black : DEColor.text.dark_3)
                    .padding(.top, self.indicator == self.linked.tag ? 4 : 0)
                if (self.indicator == self.linked.tag) {
                    Circle()
                        .frame(width: 3.6, height: 3.6, alignment: .center)
                        .foregroundColor(DEColor.main.black)
                        .transition(.opacity)
                }
            }
        }
        return curr
    }
}
