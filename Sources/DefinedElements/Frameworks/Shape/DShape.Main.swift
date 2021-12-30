import SwiftUI

/// [DE]
///
/// - TODO: Documentation.
public struct DefinedShape : DefinedView {
    ///
    public var viewConfiguration: DefinedViewConfiguration =
        .init(
            width: 75,
            height: 75
        )
    
    ///
    public var borderConfiguration: DefinedViewBorderConfiguration =
        .init(
            default: .init(color: DEColor.divider.grey_1)
        )
    
    ///
    internal var shapeType: DefinedShapeType
    
    ///
    internal var shapeStyle: DefinedShapeStyle = .plain
    
    ///
    internal var radius: CGFloat = DEDimen.corner.std
    
    ///
    internal var contentClipped: Bool = true
    
    ///
    internal var shapeColor: Color = DEColor.bg.light_1
    
    ///
    internal var borderColor: Color = DEColor.divider.grey_1
    
    ///
    internal var content: AnyView?
    
    // MARK: - Constructors
    
    /// [DE]
    public init(
        _ shapeType: DefinedShapeType
    ) {
        self.shapeType = shapeType
        self.content = nil
    }
    
    /// [DE]
    public init<Content: View>(
        _ shapeType: DefinedShapeType,
        @ViewBuilder content: () -> Content
    ) {
        self.shapeType = shapeType
        self.content = AnyView(content())
    }
    
    /// [DE Internal]
    internal init(
        originalView: DefinedShape,
        viewConfiguration: DefinedViewConfiguration? = nil,
        borderConfiguration: DefinedViewBorderConfiguration? = nil,
        shapeType: DefinedShapeType? = nil,
        shapeStyle: DefinedShapeStyle? = nil,
        radius: CGFloat? = nil,
        contentClipped: Bool? = nil,
        shapeColor: Color? = nil,
        borderColor: Color? = nil
    ) {
        self.viewConfiguration = viewConfiguration ?? originalView.viewConfiguration
        self.borderConfiguration = borderConfiguration ?? originalView.borderConfiguration
        self.shapeType = shapeType ?? originalView.shapeType
        self.shapeStyle = shapeStyle ?? originalView.shapeStyle
        self.radius = radius ?? originalView.radius
        self.contentClipped = contentClipped ?? originalView.contentClipped
        self.shapeColor = shapeColor ?? originalView.shapeColor
        self.borderColor = borderColor ?? originalView.borderColor
        self.content = originalView.content
    }
    
    // MARK: - Body
    
    public var body: some View {
        if self.content != nil {
            /* Shape with content at front */
            DefinedContent(.overlay) {
                self.content!
            }
            .definedRawFrame(
                width: self.viewConfiguration.width,
                height: self.viewConfiguration.height,
                alignment: self.viewConfiguration.alignment
            )
            .clipShape(
                DefinedShapeRenderer(
                    self.shapeType,
                    radius: self.radius
                )
            )
            .background(
                self.shape
            )
        } else {
            /* Shape only */
            self.shape
        }
    }
    
    // MARK: - Shape
    
    @ViewBuilder private var shape: some View {
        if self.shapeStyle == .bordered {
            DefinedShapeRenderer(self.shapeType, radius: self.radius)
                .stroke(
                    self.borderConfiguration.border_def.color,
                    lineWidth: self.borderConfiguration.border_def.width
                )
                .background(
                    DefinedShapeRenderer(
                        self.shapeType,
                        radius: self.radius
                    )
                    .foregroundColor(self.shapeColor)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                )
                .definedRawFrame(
                    width: self.viewConfiguration.width,
                    height: self.viewConfiguration.height,
                    alignment: self.viewConfiguration.alignment
                )
        } else {
            DefinedShapeRenderer(
                self.shapeType,
                radius: self.radius
            )
            .foregroundColor(self.shapeColor)
            .definedRawFrame(
                width: self.viewConfiguration.width,
                height: self.viewConfiguration.height,
                alignment: self.viewConfiguration.alignment
            )
        }
    }
    
    // MARK: - Shape Generator
    
    ///
    public func getShape() -> some Shape {
        return DefinedShapeRenderer(
            self.shapeType,
            radius: self.radius
        )
    }
}
