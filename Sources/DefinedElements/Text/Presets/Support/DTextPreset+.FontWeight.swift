import SwiftUI

extension DefinedTextPreset {
    /// Get a smaller font weight based on given font weight.
    static func minus(_ origin: Font.Weight) -> Font.Weight {
        switch origin {
        case .black:
            return .heavy
        case .heavy:
            return .bold
        case .bold:
            return .semibold
        case .semibold:
            return .medium
        case .medium:
            return .regular
        case .regular:
            return .thin
        case .thin:
            return .light
        case .light:
            return .ultraLight
        case .ultraLight:
            return .ultraLight
        default:
            return .regular
        }
    }
    
    /// Get a larger font weight based on given font weight.
    static func plus(_ origin: Font.Weight) -> Font.Weight {
        switch origin {
        case .black:
            return .black
        case .heavy:
            return .black
        case .bold:
            return .heavy
        case .semibold:
            return .bold
        case .medium:
            return .semibold
        case .regular:
            return .medium
        case .thin:
            return .regular
        case .light:
            return .thin
        case .ultraLight:
            return .light
        default:
            return .regular
        }
    }
}
