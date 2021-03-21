//
//  DefinedColors.swift
//
//  Created by Lingxi Li on 6/28/20.
//

import SwiftUI

enum Colors {
    case BG_DISABLED
    case BG_BLUE
    
    case BG_UNIVERSE_0
    case BG_UNIVERSE_1
    case BG_UNIVERSE_2
    
    case MAIN_WHITE
    case MAIN_BLUE
    case MAIN_BLACK
    
    case TEXT_BLACK_2
    case TEXT_BLACK_3
    case TEXT_BLACK_4
    
    func get() -> Color {
        switch self {
        case .BG_DISABLED:
            return Color.init(hex: "#fff4f4f4")
        case .BG_BLUE:
            return Color.init(hex: "#ff287df0")
        case .BG_UNIVERSE_0:
            return Color.init(hex: "#ffffffff")
        case .BG_UNIVERSE_1:
            return Color.init(hex: "#fffefefe")
        case .BG_UNIVERSE_2:
            return Color.init(hex: "#fffdfdfd")
        case .MAIN_WHITE:
            return Color.init(hex: "#ffffffff")
        case .MAIN_BLUE:
            return Color.init(hex: "#ff287df0")
        case .MAIN_BLACK:
            return Color.init(hex: "#ff262626")
        case .TEXT_BLACK_2:
            return Color.init(hex: "#ffafafaf")
        case .TEXT_BLACK_3:
            return Color.init(hex: "#ffbfbfbf")
        case .TEXT_BLACK_4:
            return Color.init(hex: "#ffcfcfcf")
        }
    }
}

extension Color{
    // Hex String -> UIColor
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
                print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            }
        } else {
            print("Scan hex error")
        }
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
