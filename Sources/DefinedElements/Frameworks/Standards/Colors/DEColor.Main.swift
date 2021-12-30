import SwiftUI

/// [DE] A color standards for `DefinedElements`.
///
/// - TODO: Dark mode support.
public class DEColor {
    /// [DE] Transparent
    public static let none = Color(hex: "#00ffffff")
    
    /// [DE] A color set for core stuff.
    public class main {
        /// [DE] Main blue
        ///
        /// Usually be used as the brand color.
        public static let blue = Color(hex: "#ff287df0")
        
        /// [DE] Main green
        ///
        /// Usually be used at Success status.
        public static let green = Color(hex: "#ff28995d")
        
        /// [DE] Main red
        public static let red = Color(hex: "#ffD2686E")
        
        /// [DE] White
        ///
        /// Just white. Mainly be used at core contents' background color.
        public static let white = Color(hex: "#ffffffff")
        
        /// [DE] Black
        ///
        /// Just Black. Not pure black. Mainly be used at core contents' foreground color.
        public static let black = Color(hex: "#ff0f0f0f")
    }
    
    /// [DE] A color set for background stuff.
    public class bg {
        /// [DE] Blue
        public static let blue = DEColor.main.blue
        
        /// [DE] Green
        public static let green = DEColor.main.green
        
        /// [DE] Light green
        public static let green_light = Color(hex: "#ffe9f4ee")
        
        /// [DE] Red
        public static let red = DEColor.main.red
        
        /// [DE] Light red
        public static let red_light = Color(hex: "#fffbf0f1")
        
        /// [DE] White
        public static let white = DEColor.main.white
        
        /// [DE] Black
        public static let black = DEColor.main.black
        
        /// [DE] Status - Disabled (White scheme)
        ///
        /// This is a color for the background on `disabled` status on white scheme.
        public static let disabled = Color(hex: "#fff4f4f4")
        
        /// [DE] Light background
        public static let light = Color(hex: "#fffefeff")
        
        /// [DE] Light background with 1 level grey
        public static let light_1 = Color(hex: "#fffdfdfe")
        
        /// [DE] Light background with 2 level grey
        public static let light_2 = Color(hex: "#fffafbfd")
        
        /// [DE] Light background with 3 level grey
        public static let light_3 = Color(hex: "#fff9fafd")
        
        /// [DE] Light background with 4 level grey
        public static let light_4 = Color(hex: "#fff7f9fc")
    }
    
    /// [DE] A color set for blur shade.
    public class blur {
        /// [DE] Light blur
        public static let light = Color(hex: "#efefef", opacity: DEColor.std.opa)
        
        /// [DE] Dark blur
        public static let dark = Color(hex: "#2f2f2f", opacity: DEColor.std.opa)
    }
    
    /// [DE] A color set for divider.
    public class divider {
        /// [DE] Grey divider
        public static let grey = Color(hex: "#fff4f4f4")
        
        /// [DE] Grey divider with 1 level darker
        public static let grey_1 = Color(hex: "#ffefefef")
        
        /// [DE] A color set for decorative divider.
        ///
        /// They have a lighter color which reduces the interfere of visual experience.
        public class deco {
            /// [DE] Grey divider
            public static let grey = Color(hex: "#fff9fafd")
        }
    }
    
    /// [DE] A color set for text and its hierarchy.
    public class text {
        /// [DE] Blue
        public static let blue = DEColor.main.blue
        
        /// [DE] Green
        public static let green = DEColor.main.green
        
        /// [DE] Red
        public static let red = DEColor.main.red
        
        /// [DE] White
        public static let white = DEColor.main.white
        
        /// [DE] Black
        public static let black = DEColor.main.black
        
        /// [DE] Dark text
        public static let dark = Color(hex: "#ff6f6f6f")
        
        /// [DE] Dark text with 1 level lighter
        public static let dark_1 = Color(hex: "#ff8f8f8f")
        
        /// [DE] Dark text with 2 level lighter
        public static let dark_2 = Color(hex: "#ffafafaf")
        
        /// [DE] Dark text with 3 level lighter
        public static let dark_3 = Color(hex: "#ffbfbfbf")
        
        /// [DE] Dark text with 4 level lighter
        public static let dark_4 = Color(hex: "#ffcfcfcf")
        
        /// [DE] Dark text with 5 level lighter
        public static let dark_5 = Color(hex: "#ffdfdfdf")
    }
    
    /// [DE] Standard Values (NOT COLORS)
    ///
    /// This is a set of color-related values. They are not colors!
    public class std {
        /// [DE] Translucency Standard Value
        ///
        /// This value has been specifically tested on real devices.
        /// It can usually be used on some translucent views that do not want to be interfered by the background view.
        public static let opa: Double = 0.975
    }
}

// MARK: - Extension - Opa for Color

extension Color {
    /// [DE] Apply the Translucency Standard Value to this color.
    ///
    /// It can usually be used on some translucent views that do not want to be interfered by the background view.
    ///
    /// - Returns: The color after converting.
    public func opa() -> Color {
        return self.opacity(DEColor.std.opa)
    }
}

// MARK: - Extension - Hex for Color

/// Extend for the support of Hex text.
extension Color {
    /// [DE] Make a color by Hex String
    ///
    /// - Parameters:
    ///   - hex: The hex string.
    ///   - opacity: The opacity (only available when the length of hex is less than 8).
    public init(hex: String, opacity: Double = 1.0) {
        var red:   Double = 0.0
        var green: Double = 0.0
        var blue:  Double = 0.0
        var alpha: Double = opacity
        var hex:   String = hex
        
        if hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index...])
        }
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
            case 3:
                red   = Double((hexValue & 0xF00) >> 8)       / 15.0
                green = Double((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = Double(hexValue & 0x00F)              / 15.0
            case 4:
                alpha = Double((hexValue & 0xF000) >> 12)     / 15.0
                red   = Double((hexValue & 0x0F00) >> 8)      / 15.0
                green = Double((hexValue & 0x00F0) >> 4)      / 15.0
                blue  = Double(hexValue & 0x000F)             / 15.0
            case 6:
                red   = Double((hexValue & 0xFF0000) >> 16)   / 255.0
                green = Double((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = Double(hexValue & 0x0000FF)           / 255.0
            case 8:
                alpha = Double((hexValue & 0xFF000000) >> 24) / 255.0
                red   = Double((hexValue & 0x00FF0000) >> 16) / 255.0
                green = Double((hexValue & 0x0000FF00) >> 8)  / 255.0
                blue  = Double(hexValue & 0x000000FF)         / 255.0
            default:
                DefinedWarning.send(
                    from: "DEColor",
                    "Invalid RGB string, the number of characters after '#' should be either 3, 4, 6 or 8"
                )
            }
        } else {
            DefinedWarning.send(from: "DEColor", "Scan hex error")
        }
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
