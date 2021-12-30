import SwiftUI

/// [DE] A clickable button view with some text / icons or some custom views.
///
/// - TODO: Haptic Builder support.
/// - TODO: More button styles.
/// - TODO: Documentations.
public struct DefinedButton : DefinedView {
    ///
    public var viewConfiguration: DefinedViewConfiguration = .init()
    
    ///
    public var backgroundConfiguration: DefinedViewBackgroundConfiguration = .init()
    
    ///
    public var borderConfiguration: DefinedViewBorderConfiguration = .init()
    
    /// An object containing the configuration information for button's preset.
    ///
    /// - Note: Please be award that this is not modifiable! It is not a `State` or something, thus when you want to modify the configuration, you have to generate a new configuration object using the modifier constructor.
    internal var buttonConfiguration: DefinedButtonConfiguration = .init()
    
    /// [DE] A type value that will be used when this button contains some views instead of using a preset layout.
    internal var layoutType: DefinedContentLayoutType
    
    /// [DE]
    internal var layoutAlignment: Alignment
    
    /// [DE] Clicking action.
    internal var action: () -> Void
    
    /// [DE] Current status of the button.
    @Binding public var status: GeneralStatus
    
    /// [DE] Button content views.
    internal var content: AnyView? = nil
    
    ///
    internal var textPreset: DefinedTextPreset = .button
    
    ///
    internal var padding_left: CGFloat = 13
    
    ///
    internal var padding_right: CGFloat = 13
    
    ///
    internal var padding_top: CGFloat = 12
    
    ///
    internal var padding_bottom: CGFloat = 12
    
    ///
    internal var corner_radius: CGFloat = DEDimen.corner.std
    
    /// The text color when lazy status is `default`.
    internal var textColor_def: Color = DEColor.text.dark_5
    
    /// The text color when lazy status is `loading`.
    internal var textColor_loading: Color = DEColor.bg.disabled
    
    /// The text color when lazy status is `active`.
    internal var textColor_act: Color = DEColor.main.black
    
    /// The text color when lazy status is `done`.
    internal var textColor_done: Color = DEColor.main.black
    
    /// The text color when lazy status is `error`.
    internal var textColor_error: Color = DEColor.bg.disabled
    
    /// The text color when status is `disabled`.
    internal var textColor_disabled: Color = DEColor.bg.disabled
    
    ///
    internal var disabled_def: Bool = false
    
    ///
    internal var disabled_loading: Bool = true
    
    ///
    internal var disabled_act: Bool = false
    
    ///
    internal var disabled_done: Bool = true
    
    ///
    internal var disabled_error: Bool = false
    
    ///
    @State internal var scale: CGFloat = 1.0
    
    // MARK: - Constructors
    
    /// [DE]
    public init<FromPage: DefinedPage, ToPage: DefinedPage>(
        _ text: String,
        footnote: String? = nil,
        icon: Image? = nil,
        alignment: Alignment = .center,
        from departure: FromPage,
        to destination: ToPage,
        how presentType: DefinedPresentType = .link,
        status: Binding<GeneralStatus> = .constant(.default)
    ) {
        self.layoutType = .horizontal
        self.layoutAlignment = alignment
        self.action = {
            if presentType == .jump {
                DefinedViewManager.find(departure).jump(to: destination)
            } else if presentType == .link {
                DefinedViewManager.find(departure).link(to: destination)
            } else {
                DefinedViewManager.find(departure).swap(with: destination)
            }
        }
        self._status = status
        
        self.buttonConfiguration = .init(
            oldConfiguration: self.buttonConfiguration,
            text: text,
            footnote: footnote,
            icon: icon
        )
    }
    
    /// [DE]
    public init(
        _ text: String,
        footnote: String? = nil,
        icon: Image? = nil,
        alignment: Alignment = .center,
        action: @escaping () -> Void = {},
        status: Binding<GeneralStatus> = .constant(.default)
    ) {
        self.layoutType = .horizontal
        self.layoutAlignment = alignment
        self.action = action
        self._status = status
        
        self.buttonConfiguration = .init(
            oldConfiguration: self.buttonConfiguration,
            text: text,
            footnote: footnote,
            icon: icon
        )
    }
    
    /// [DE]
    public init<Content: View>(
        _ layoutType: DefinedContentLayoutType = .horizontal,
        alignment: Alignment = .center,
        action: @escaping () -> Void = {},
        fixedStatus: GeneralStatus = .default,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.layoutType = layoutType
        self.layoutAlignment = alignment
        self.action = action
        self._status = .constant(fixedStatus)
        self.content = AnyView(
            DefinedContent(
                self.layoutType,
                alignment: self.layoutAlignment
            ) {
                content()
            }
        )
    }
    
    /// [DE]
    public init<Content: View>(
        _ layoutType: DefinedContentLayoutType = .horizontal,
        alignment: Alignment = .center,
        action: @escaping () -> Void = {},
        status: Binding<GeneralStatus>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.layoutType = layoutType
        self.layoutAlignment = alignment
        self.action = action
        self._status = status
        self.content = AnyView(
            DefinedContent(
                self.layoutType,
                alignment: self.layoutAlignment
            ) {
                content()
            }
        )
        
    }
    
    // MARK: - Modifier Constructor
    
    /// [DE Internal]
    internal init(
        originalView: DefinedButton,
        viewConfiguration: DefinedViewConfiguration? = nil,
        backgroundConfiguration: DefinedViewBackgroundConfiguration? = nil,
        borderConfiguration: DefinedViewBorderConfiguration? = nil,
        buttonConfiguration: DefinedButtonConfiguration? = nil,
        layoutType: DefinedContentLayoutType? = nil,
        layoutAlignment: Alignment? = nil,
        action: (() -> Void)? = nil,
        status: Binding<GeneralStatus>? = nil,
        content: AnyView? = nil,
        padding_left: CGFloat? = nil,
        padding_right: CGFloat? = nil,
        padding_top: CGFloat? = nil,
        padding_bottom: CGFloat? = nil,
        corner_radius: CGFloat? = nil,
        textColor_def: Color? = nil,
        textColor_loading: Color? = nil,
        textColor_act: Color? = nil,
        textColor_done: Color? = nil,
        textColor_error: Color? = nil,
        textColor_disabled: Color? = nil,
        disabled_def: Bool? = nil,
        disabled_loading: Bool? = nil,
        disabled_act: Bool? = nil,
        disabled_done: Bool? = nil,
        disabled_error: Bool? = nil
    ) {
        self.viewConfiguration = viewConfiguration ?? originalView.viewConfiguration
        self.backgroundConfiguration = backgroundConfiguration ?? originalView.backgroundConfiguration
        self.borderConfiguration = borderConfiguration ?? originalView.borderConfiguration
        self.buttonConfiguration = buttonConfiguration ?? originalView.buttonConfiguration
        self.layoutType = layoutType ?? originalView.layoutType
        self.layoutAlignment = layoutAlignment ?? originalView.layoutAlignment
        self.action = action ?? originalView.action
        self._status = status ?? originalView.$status
        self.content = content ?? originalView.content
        self.padding_left = padding_left ?? originalView.padding_left
        self.padding_right = padding_right ?? originalView.padding_right
        self.padding_top = padding_top ?? originalView.padding_top
        self.padding_bottom = padding_bottom ?? originalView.padding_bottom
        self.corner_radius = corner_radius ?? originalView.corner_radius
        self.textColor_def = textColor_def ?? originalView.textColor_def
        self.textColor_loading = textColor_loading ?? originalView.textColor_loading
        self.textColor_act = textColor_act ?? originalView.textColor_act
        self.textColor_done = textColor_done ?? originalView.textColor_done
        self.textColor_error = textColor_error ?? originalView.textColor_error
        self.textColor_disabled = textColor_disabled ?? originalView.textColor_disabled
        self.disabled_def = disabled_def ?? originalView.disabled_def
        self.disabled_loading = disabled_loading ?? originalView.disabled_loading
        self.disabled_act = disabled_act ?? originalView.disabled_act
        self.disabled_done = disabled_done ?? originalView.disabled_done
        self.disabled_error = disabled_error ?? originalView.disabled_error
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: {
            self.action()
        }) {
            self.presetView
                .padding(.leading, self.padding_left)
                .padding(.trailing, self.padding_right)
                .padding(.top, self.padding_top)
                .padding(.bottom, self.padding_bottom)
                .definedRawFrame(
                    width: self.viewConfiguration.width,
                    height: self.viewConfiguration.height,
                    alignment: self.viewConfiguration.alignment
                )
                .background(
                    DefinedShape(.rounded_rectangle)
                        .cornerRadius(self.corner_radius) /* Background Corner */
                        .style( /* Background Shape Style */
                            self.status == .disabled ? (self.borderConfiguration.border_disabled.width > 0 ? .bordered : .plain) :
                                self.status == .error ? (self.borderConfiguration.border_disabled.width > 0 ? .bordered : .plain) :
                                self.status == .done ? (self.borderConfiguration.border_done.width > 0 ? .bordered : .plain) :
                                self.status == .active ? (self.borderConfiguration.border_act.width > 0 ? .bordered : .plain) :
                                self.status == .loading ? (self.borderConfiguration.border_loading.width > 0 ? .bordered : .plain) :
                                (self.borderConfiguration.border_def.width > 0 ? .bordered : .plain)
                        )
                        .border(
                            self.status == .disabled ? self.borderConfiguration.border_disabled :
                                self.status == .error ? self.borderConfiguration.border_error :
                                self.status == .done ? self.borderConfiguration.border_done :
                                self.status == .active ? self.borderConfiguration.border_act :
                                self.status == .loading ? self.borderConfiguration.border_loading :
                                self.borderConfiguration.border_def
                        )
                        .definedSize(width: .full, height: .full)
                )
                .scaleEffect(self.scale)
        }
        .buttonStyle(
            DefinedButtonStyleBoard(self.$scale)
        )
    }
    
    // MARK: - Preset Builder
    
    @ViewBuilder private var presetView: some View {
        if self.content != nil {
            self.content
        } else {
            DefinedText(self.buttonConfiguration.text)
                .preset(self.textPreset)
                .contentColor(
                    self.status == .disabled ? self.textColor_disabled :
                        self.status == .error ? self.textColor_error :
                        self.status == .done ? self.textColor_done :
                        self.status == .active ? self.textColor_act :
                        self.status == .loading ? self.textColor_loading :
                        self.textColor_def
                )
        }
    }
}
