import Foundation
import SwiftUI

/// [DE] A border struct (not a view).
///
/// The border will not be rendered directly as a view.
/// It is designed to be passed into another view needing a border.
public struct DefinedBorder {
    /// The foreground color of border.
    public var color: Color
    
    /// The width of border.
    public var width: CGFloat
    
    /// The type of border.
    ///
    /// It can be `outside` (default), `inside`, and `center`, representing the different positions of border.
    public var type: DefinedBorderType
    
    /// [DE] Create a border object.
    public init(color: Color, width: CGFloat = 1, type: DefinedBorderType = .inside) {
        self.color = color
        self.width = width
        self.type = type
    }
    
    /// [Internal]
    internal init(
        old: DefinedBorder,
        color: Color? = nil,
        width: CGFloat? = nil,
        type: DefinedBorderType? = nil
    ) {
        self.color = color ?? old.color
        self.width = width ?? old.width
        self.type = type ?? old.type
    }
    
    /// [DE] Change the color of border.
    ///
    /// - Parameter color: The color you want to set.
    ///
    /// - Returns: The new border after setting the color.
    public func color(_ color: Color) -> DefinedBorder {
        return DefinedBorder(old: self, color: color)
    }
    
    /// [DE] Change the width of border.
    ///
    /// - Parameter width: The width you want to set.
    ///
    /// - Returns: The new border after setting the width.
    public func width(_ width: CGFloat) -> DefinedBorder {
        return DefinedBorder(old: self, width: width)
    }
    
    /// [DE] Change the type of border.
    ///
    /// - Parameter type: The type you want to set.
    ///
    /// - Returns: The new border after setting the type.
    public func type(_ type: DefinedBorderType) -> DefinedBorder {
        return DefinedBorder(old: self, type: type)
    }
}

public extension DefinedBorder {
    /// [DE] The default border.
    static let `default` = DefinedBorder(color: .blue, width: 1)
    
    /// [DE] A bold border with default color.
    static let bold = DefinedBorder(color: .blue, width: 2)
}
