import SwiftUI

/// - TODO: Documentation.
struct DefinedShapeRenderer : Shape {
    ///
    var cornerRadius: CGFloat
    
    ///
    var shapeType: DefinedShapeType
    
    ///
    init(
        _ shape: DefinedShapeType,
        radius: CGFloat = DEDimen.corner.std
    ) {
        self.shapeType = shape
        self.cornerRadius = radius
    }
    
    ///
    func path(in rect: CGRect) -> Path {
        if shapeType == .circular_rectangle {
            return .init(roundedRect: rect, cornerRadius: self.cornerRadius, style: .circular)
        } else {
            return .init(roundedRect: rect, cornerRadius: self.cornerRadius, style: .continuous)
        }
    }
}
