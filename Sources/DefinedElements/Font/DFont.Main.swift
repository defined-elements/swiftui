import SwiftUI

/// DefinedFont - 字体家族 @ DefinedElements
///
/// - TODO: Default Font real default.
public class DefinedFont {
    ///
    private static var defaultFont = DefinedFont(fileName: "")
    
    ///
    public static let `default`: DefinedFont = DefinedFont.defaultFont
    
    ///
    public var fileName: String
    
    ///
    public init(fileName: String) {
        self.fileName = fileName
    }
    
    ///
    public func get(dynamic size: CGFloat) -> Font {
        return Font.custom(self.fileName, size: size)
    }
    
    ///
    public func get(fixed size: CGFloat) -> Font {
        return Font.custom(self.fileName, fixedSize: size)
    }
    
    ///
    public static func setDefault(_ def: DefinedFont) {
        self.defaultFont.fileName = def.fileName
    }
}
