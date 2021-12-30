import SwiftUI

// README:
// You may find that this file has a lot of repeated documents,
// that is because we want to make all methods documented whatever the parameter type is.
// And since we should NOT intendedly use optional for all those parameters,
// which may help us to combine some methods together,
// I have to create separate methods.
// The core modifier is reusable, so it is not a big deal. They are not lack of reusing.

// TODO: More detailed documents.

extension View {
    
    // MARK: CGFloat
    
    /// [DE] Put this view in an invisible frame with given constrains. Horizontal direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        alignment: Alignment? = nil
    ) -> some View {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: nil,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. Vertical direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> some View {
        return DefinedViewFrameSizeModifier(
            width: nil,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> some View {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
    
    // MARK: FullFrameSize
    
    /// [DE] Put this view in an invisible frame with given constrains. Horizontal direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> some View {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: nil,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. Vertical direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> some View {
        return DefinedViewFrameSizeModifier(
            width: nil,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> some View {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    // MARK: Mix
    
    /// [DE] Put this view in an invisible frame with given constrains. (Mix of match-parent and fixed size constrains)
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// Or you can mix them like this:
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: 40)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> some View {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. (Mix of match-parent and fixed size constrains)
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// Or you can mix them like this:
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: 40)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> some View {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
}

// MARK: - Extension - DV

extension DefinedView {
    
    // MARK: CGFloat
    
    /// [DE] Put this view in an invisible frame with given constrains. Horizontal direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: nil,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. Vertical direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: nil,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
    
    // MARK: FullFrameSize
    
    /// [DE] Put this view in an invisible frame with given constrains. Horizontal direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: nil,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. Vertical direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: nil,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    // MARK: Mix
    
    /// [DE] Put this view in an invisible frame with given constrains. (Mix of match-parent and fixed size constrains)
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// Or you can mix them like this:
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: 40)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. (Mix of match-parent and fixed size constrains)
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// Or you can mix them like this:
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: 40)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
}

// MARK: - Extension - DVMV

extension DefinedViewModifiedView {
    
    // MARK: CGFloat
    
    /// [DE] Put this view in an invisible frame with given constrains. Horizontal direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: nil,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. Vertical direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: nil,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
    
    // MARK: FullFrameSize
    
    /// [DE] Put this view in an invisible frame with given constrains. Horizontal direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: nil,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. Vertical direction only.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: nil,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains.
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    // MARK: Mix
    
    /// [DE] Put this view in an invisible frame with given constrains. (Mix of match-parent and fixed size constrains)
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// Or you can mix them like this:
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: 40)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: CGFloat,
        height: DefinedViewFullFrameSize,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: width,
            height: .infinity,
            alignment: alignment
        ).modify(view: self)
    }
    
    /// [DE] Put this view in an invisible frame with given constrains. (Mix of match-parent and fixed size constrains)
    ///
    /// This method fits two types of situations:
    /// * If you need to define a fixed size of frame,
    /// * If you need to define a match-parent size of frame.
    ///
    /// When you simply want to set a width or height for the view, just put a CGFloat value in, like this:
    ///
    /// ``` swift
    /// view.definedSize(width: 30.25, height: 15.5, alignment: .center)
    /// ```
    ///
    /// Or you can just type an integer (treat as CGFloat) and without defining alignment if you do not need it.
    ///
    /// ``` swift
    /// view.definedSize(width: 20, height: 10)
    /// ```
    ///
    /// When you want to make your view fully extended in one direction,
    /// use `.full` (or you can use `.infinity`, but I highly NOT recommended) on that direction.
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: .full)
    /// ```
    ///
    /// Or you can mix them like this:
    ///
    /// ``` swift
    /// view.definedSize(width: .full, height: 40)
    /// ```
    ///
    /// - Parameters:
    ///   - width: The width constrain of the frame.
    ///   - height: The height constrain of the frame.
    ///   - alignment: The position where the wrapped view should be in the frame.
    /// - Returns: A modified view containing the output of the frame you just defined.
    public func definedSize(
        width: DefinedViewFullFrameSize,
        height: CGFloat,
        alignment: Alignment? = nil
    ) -> DefinedViewModifiedView<Self> {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
}

// MARK: - Modifier

/// [DE Internal] A modifier that changes the frame of the view (or root view).
///
/// - TODO: Modify ViewConfiguration if active.
internal struct DefinedViewFrameSizeModifier : DefinedViewModifier {
    var name: String = "FrameSize"
    
    var width: CGFloat?
    var height: CGFloat?
    var alignment: Alignment?
    
    init(width: CGFloat? = nil, height: CGFloat? = nil, alignment: Alignment? = nil) {
        self.width = width
        self.height = height
        self.alignment = alignment
    }
    
    func modify<OtherViews: View>(
        view: OtherViews
    ) -> some View {
        return frameModifier(
            view: view,
            width: self.width,
            height: self.height,
            alignment: self.alignment
        )
    }
    
    func modify<OtherModifiedViews: DefinedView>(
        view: OtherModifiedViews
    ) -> DefinedViewModifiedView<OtherModifiedViews> {
        return forceFrameSize(view: view)
    }

    func modify<OtherModifiedViews: DefinedView>(
        view: DefinedViewModifiedView<OtherModifiedViews>
    ) -> DefinedViewModifiedView<OtherModifiedViews> {
        return forceFrameSize(view: view)
    }
    
    func forceFrameSize<OtherModifiedViews: DefinedView>(
        view: OtherModifiedViews
    ) -> DefinedViewModifiedView<OtherModifiedViews> {
        print("YES: Modify \(name) (forcely wrapper) for DefinedView correctly!")
        return DefinedViewModifiedView(
            root: view,
            configuration: .init(),
            content: { root in
                frameModifier(
                    view: root,
                    width: self.width,
                    height: self.height,
                    alignment: self.alignment
                )
            }
        )
    }

    func forceFrameSize<OtherModifiedViews: DefinedView>(
        view: DefinedViewModifiedView<OtherModifiedViews>
    ) -> DefinedViewModifiedView<OtherModifiedViews> {
        print("YES: Modify \(name) (forcely wrapper) for DefinedViewModifiedView correctly!")
        return DefinedViewModifiedView(
            root: view.root,
            configuration: view.configuration,
            content: { root in
                frameModifier(
                    view: view.content(root),
                    width: self.width,
                    height: self.height,
                    alignment: self.alignment
                )
            }
        )
    }
    
    // MARK: - Core Modifier
    
    @ViewBuilder private func frameModifier<CoreView: View>(
        view: CoreView,
        width: CGFloat?,
        height: CGFloat?,
        alignment: Alignment?
    ) -> some View {
        if alignment == nil {
            view
                .frame(
                    width: (width != nil && width! != .infinity && width! >= 0) ? width : nil,
                    height: (height != nil && height! != .infinity && height! >= 0) ? height : nil
                )
                .frame(
                    maxWidth: (width != nil && width! == .infinity) ? width : nil,
                    maxHeight: (height != nil && height! == .infinity) ? height : nil
                )
        } else {
            view
                .frame(
                    width: (width != nil && width! != .infinity && width! >= 0) ? width : nil,
                    height: (height != nil && height! != .infinity && height! >= 0) ? height : nil,
                    alignment: alignment!
                )
                .frame(
                    maxWidth: (width != nil && width! == .infinity) ? width : nil,
                    maxHeight: (height != nil && height! == .infinity) ? height : nil,
                    alignment: alignment!
                )
        }
    }
}
