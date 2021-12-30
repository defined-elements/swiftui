import SwiftUI

/// [DE]
public struct DefinedButtonPreset : DefinedPresetProtocol {
    var viewConfiguration: DefinedViewConfiguration?
    
    var backgroundConfiguration: DefinedViewBackgroundConfiguration?
    
    var borderConfiguration: DefinedViewBorderConfiguration?
    
    var padding_left: CGFloat?
    
    var padding_right: CGFloat?
    
    var padding_top: CGFloat?
    
    var padding_bottom: CGFloat?
    
    var corner_radius: CGFloat?
    
    var textColor_def: Color?
    
    var textColor_loading: Color?
    
    var textColor_act: Color?
    
    var textColor_done: Color?
    
    var textColor_error: Color?
    
    var textColor_disabled: Color?
    
    init(
        viewConfiguration: DefinedViewConfiguration? = nil,
        backgroundConfiguration: DefinedViewBackgroundConfiguration? = nil,
        borderConfiguration: DefinedViewBorderConfiguration? = nil,
        padding_left: CGFloat? = 13,
        padding_right: CGFloat? = 13,
        padding_top: CGFloat? = 12,
        padding_bottom: CGFloat? = 12,
        corner_radius: CGFloat? = DEDimen.corner.std,
        textColor_def: Color? = nil,
        textColor_loading: Color? = nil,
        textColor_act: Color? = nil,
        textColor_done: Color? = nil,
        textColor_error: Color? = nil,
        textColor_disabled: Color? = nil
    ) {
        self.viewConfiguration = viewConfiguration
        self.backgroundConfiguration = backgroundConfiguration
        self.borderConfiguration = borderConfiguration
        self.padding_left = padding_left
        self.padding_right = padding_right
        self.padding_top = padding_top
        self.padding_bottom = padding_bottom
        self.corner_radius = corner_radius
        self.textColor_def = textColor_def
        self.textColor_loading = textColor_loading
        self.textColor_act = textColor_act
        self.textColor_done = textColor_done
        self.textColor_error = textColor_error
        self.textColor_disabled = textColor_disabled
    }
}

extension DefinedButtonPreset {
    public static let classic = DefinedButtonPreset(
        viewConfiguration: .init(
            width: .infinity,
            isWidthSet: true,
            height: 56,
            isHeightSet: true
        ),
        backgroundConfiguration: .init(
            default: AnyView(DEColor.bg.blue),
            loading: AnyView(DEColor.bg.blue),
            active: AnyView(DEColor.bg.blue),
            done: AnyView(DEColor.bg.green),
            error: AnyView(DEColor.bg.red),
            disabled: AnyView(DEColor.bg.disabled)
        ),
        borderConfiguration: .init(
            default: nil,
            loading: nil,
            active: nil,
            done: nil,
            error: nil,
            disabled: nil
        ),
        padding_left: nil,
        padding_right: nil,
        padding_top: nil,
        padding_bottom: nil,
        corner_radius: nil,
        textColor_def: DEColor.text.white,
        textColor_loading: DEColor.text.white,
        textColor_act: DEColor.text.white,
        textColor_done: DEColor.text.white,
        textColor_error: DEColor.text.white,
        textColor_disabled: DEColor.text.dark_3
    )
    
    public static let light = DefinedButtonPreset(
        viewConfiguration: .init(),
        backgroundConfiguration: .init(
            default: AnyView(DEColor.bg.light_1),
            loading: AnyView(DEColor.bg.light_1),
            active: AnyView(DEColor.bg.light_1),
            done: AnyView(DEColor.bg.green_light),
            error: AnyView(DEColor.bg.red_light),
            disabled: AnyView(DEColor.bg.disabled)
        ),
        borderConfiguration: .init(
            default: DefinedBorder(
                color: DEColor.divider.grey_1,
                width: DEDimen.border.width,
                type: .outside
            ),
            loading: DefinedBorder(
                color: DEColor.divider.grey_1,
                width: DEDimen.border.width,
                type: .outside
            ),
            active: DefinedBorder(
                color: DEColor.divider.grey_1,
                width: DEDimen.border.width,
                type: .outside
            ),
            done: DefinedBorder(
                color: DEColor.divider.grey_1,
                width: DEDimen.border.width,
                type: .outside
            ),
            error: DefinedBorder(
                color: DEColor.divider.grey_1,
                width: DEDimen.border.width,
                type: .outside
            ),
            disabled: DefinedBorder(
                color: DEColor.divider.grey_1,
                width: DEDimen.border.width,
                type: .outside
            )
        ),
        padding_left: 14,
        padding_right: 14,
        padding_top: 9,
        padding_bottom: 9,
        corner_radius: DEDimen.corner.small,
        textColor_def: DEColor.text.dark_2,
        textColor_loading: DEColor.text.dark_2,
        textColor_act: DEColor.text.dark_2,
        textColor_done: DEColor.text.dark_2,
        textColor_error: DEColor.text.dark_2,
        textColor_disabled: DEColor.text.dark_3
    )
}
