import SwiftUI

/// [DE] A configuration class working for `DefinedView` protocol system.
///
/// Fields of this struct should be able to access from outside (for development purpose),
/// but should NOT be able to modify from outside!
/// So we make them all `private(set)` for modifier and `public` for accessor.
public struct DefinedViewConfiguration {
    /// A boolean representing if the `width` and `height` are activated for defining the internal frame size.
    ///
    /// - Important: This variable should NOT be changed!
    private(set) public var inactive: Bool
    
    /// The frame width of the view.
    ///
    /// When it is `.infinity`, we will automatically push left and right boundaries to the limit.
    /// You can manually set the width by using `.infinity`,
    /// or you can use `.full` in setting the frame to avoid buggy.
    private(set) public var width: CGFloat
    
    /// The frame height of the view.
    ///
    /// When it is `.infinity`, we will automatically push top and bottom boundaries to the limit.
    /// You can manually set the width by using `.infinity`,
    /// or you can use `.full` in setting the frame to avoid buggy.
    private(set) public var height: CGFloat

    /// Width constrain flag. Is this view constrained by the **width**?
    ///
    /// True for constrain. False for not.
    ///
    /// In other words, if it is not constrained, then we will not render the frame by the width value.
    private(set) public var isWidthConstrained: Bool
    
    /// Height constrain flag. Is this view constrained by the **height**?
    ///
    /// True for constrain. False for not.
    ///
    /// In other words, if it is not constrained, then we will not render the frame by the height value.
    private(set) public var isHeightConstrained: Bool
    
    /// Width setup flag. Is this view constrained by a post-setting **width**?
    ///
    /// True for manually setting. False for default setting.
    ///
    /// In other words, check if we need to apply another frame set on this view.
    /// If it has already been set once, we do NOT need to, then try a wrap.
    private(set) public var isWidthSet: Bool
    
    /// Height setup flag. Is this view constrained by a post-setting **height**?
    ///
    /// True for manually setting. False for default setting.
    ///
    /// In other words, check if we need to apply another frame set on this view.
    /// If it has already been set once, we do NOT need to, then try a wrap.
    private(set) public var isHeightSet: Bool
    
    /// The frame alignment of the view.
    ///
    /// It treats as the same as the default `alignment`,
    /// but we are actually able to manually setup the usage of this value in a view component.
    ///
    /// - Note: The developer can manually use this value instead of using it in the default way.
    private(set) public var alignment: Alignment
    
    /// Alignment setup flag. Is this view constrained by a post-setting **alignment**?
    ///
    /// True for manually setting. False for default setting.
    private(set) public var isAlignmentSet: Bool
    
    /// [DE Inactive] Create a ViewConfiguration that does NOT apply onto the view.
    ///
    /// - Note: In this case, the root view should NOT use these values anymore!
    public init(inactive: Bool) {
        self.inactive = inactive
        self.width = 0
        self.isWidthConstrained = false
        self.isWidthSet = false
        self.height = 0
        self.isHeightConstrained = false
        self.isHeightSet = false
        self.alignment = .center
        self.isAlignmentSet = false
    }
    
    /// [DE] Create a ViewConfiguration with by default no frame constrained.
    ///
    /// - Parameters:
    ///   - alignment: The default alignment of the frame. (Optional, default as `.center`)
    ///   - isAlignmentSet: Will we treat it as a manual set? (So the alignment will not be overrided later)
    public init(
        alignment: Alignment = .center,
        isAlignmentSet: Bool = false
    ) {
        self.inactive = false
        self.width = 0
        self.isWidthConstrained = false
        self.isWidthSet = false
        self.height = 0
        self.isHeightConstrained = false
        self.isHeightSet = false
        self.alignment = alignment
        self.isAlignmentSet = isAlignmentSet
    }
    
    /// [DE] Create a ViewConfiguration with by default width frame constrained.
    ///
    /// - Parameters:
    ///   - width: The width of the view frame.
    ///   - isWidthSet: Will we treat this width as a manual set? (So the width will not be overrided later)
    ///   - alignment: The default alignment of the frame.
    ///   - isAlignmentSet: Will we treat this alignment as a manual set? (So the alignment will not be overrided later)
    public init(
        width: CGFloat,
        isWidthSet: Bool = false,
        alignment: Alignment = .center,
        isAlignmentSet: Bool = false
    ) {
        self.inactive = false
        self.width = width
        self.isWidthConstrained = true
        self.isWidthSet = isWidthSet
        self.height = 0
        self.isHeightConstrained = false
        self.isHeightSet = false
        self.alignment = alignment
        self.isAlignmentSet = isAlignmentSet
    }
    
    /// [DE] Create a ViewConfiguration with by default height frame constrained.
    ///
    /// - Parameters:
    ///   - height: The height of the view frame.
    ///   - isHeightSet: Will we treat this height as a manual set? (So the height will not be overrided later)
    ///   - alignment: The default alignment of the frame.
    ///   - isAlignmentSet: Will we treat this alignment as a manual set? (So the alignment will not be overrided later)
    public init(
        height: CGFloat,
        isHeightSet: Bool = false,
        alignment: Alignment = .center,
        isAlignmentSet: Bool = false
    ) {
        self.inactive = false
        self.width = 0
        self.isWidthConstrained = false
        self.isWidthSet = false
        self.height = height
        self.isHeightConstrained = true
        self.isHeightSet = isHeightSet
        self.alignment = alignment
        self.isAlignmentSet = isAlignmentSet
    }
    
    /// [DE] Create a ViewConfiguration with by default full frame constrained.
    ///
    /// - Parameters:
    ///   - width: The width of the view frame.
    ///   - isWidthSet: Will we treat this width as a manual set? (So the width will not be overrided later)
    ///   - height: The height of the view frame.
    ///   - isHeightSet: Will we treat this height as a manual set? (So the height will not be overrided later)
    ///   - alignment: The default alignment of the frame.
    ///   - isAlignmentSet: Will we treat this alignment as a manual set? (So the alignment will not be overrided later)
    public init(
        width: CGFloat,
        isWidthSet: Bool = false,
        height: CGFloat,
        isHeightSet: Bool = false,
        alignment: Alignment = .center,
        isAlignmentSet: Bool = false
    ) {
        self.inactive = false
        self.width = width
        self.isWidthConstrained = true
        self.isWidthSet = isWidthSet
        self.height = height
        self.isHeightConstrained = true
        self.isHeightSet = isHeightSet
        self.alignment = alignment
        self.isAlignmentSet = isAlignmentSet
    }
    
    /// [Internal]
    internal init(
        oldConfiguration: DefinedViewConfiguration,
        width: CGFloat? = nil,
        isWidthSet: Bool? = nil,
        height: CGFloat? = nil,
        isHeightSet: Bool? = nil,
        alignment: Alignment? = nil,
        isAlignmentSet: Bool? = nil
    ) {
        self.inactive = oldConfiguration.inactive // this value may NOT be changed during copying.
        self.width = width ?? oldConfiguration.width
        self.isWidthConstrained = oldConfiguration.isWidthConstrained || width != nil
        self.isWidthSet = isWidthSet ?? oldConfiguration.isWidthSet
        self.height = height ?? oldConfiguration.height
        self.isHeightConstrained = oldConfiguration.isHeightConstrained || height != nil
        self.isHeightSet = isHeightSet ?? oldConfiguration.isHeightSet
        self.alignment = alignment ?? oldConfiguration.alignment
        self.isAlignmentSet = isAlignmentSet ?? (oldConfiguration.isAlignmentSet || alignment != nil)
    }
}
