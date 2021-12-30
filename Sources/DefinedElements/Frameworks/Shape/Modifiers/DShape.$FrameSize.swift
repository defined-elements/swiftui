import SwiftUI

extension DefinedShape {
    
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
        if self.viewConfiguration.inactive {
            return DefinedViewModifiedView(
                root: self,
                configuration: .init(),
                content: { root in
                    root
                }
            )
        }
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
    ) -> DefinedViewModifiedView<DefinedShape> {
        if self.viewConfiguration.inactive {
            return DefinedViewModifiedView(
                root: self,
                configuration: .init(),
                content: { root in
                    root
                }
            )
        }
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
}

// MARK: - Extension - DVMV

extension DefinedViewModifiedView where Self.RootViewType == DefinedShape {
    
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
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
    ) -> DefinedViewModifiedView<DefinedShape> {
        return DefinedViewFrameSizeModifier(
            width: .infinity,
            height: height,
            alignment: alignment
        ).modify(view: self)
    }
}

extension DefinedViewFrameSizeModifier {
    func modify(
        view: DefinedShape
    ) -> DefinedViewModifiedView<DefinedShape> {
        print("YES: Modify \(name) for DefinedText correctly!")
        
        let newRootView = DefinedShape(
            originalView: view,
            viewConfiguration: .init(
                oldConfiguration: view.viewConfiguration,
                width: self.width,
                isWidthSet: self.width != nil || view.viewConfiguration.isWidthSet,
                height: self.height,
                isHeightSet: self.height != nil || view.viewConfiguration.isHeightSet,
                alignment: self.alignment,
                isAlignmentSet: self.alignment != nil || view.viewConfiguration.isAlignmentSet
            )
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: .init(),
            content: { root in
                root
            }
        )
    }
    
    func modify(
        view: DefinedViewModifiedView<DefinedShape>
    ) -> DefinedViewModifiedView<DefinedShape> {
        print("YES: Modify \(name) for DefinedViewModifiedView correctly!")
        
        let newRootView = DefinedShape(
            originalView: view.root,
            viewConfiguration: .init(
                oldConfiguration: view.viewConfiguration,
                width: self.width,
                isWidthSet: self.width != nil || view.viewConfiguration.isWidthSet,
                height: self.height,
                isHeightSet: self.height != nil || view.viewConfiguration.isHeightSet,
                alignment: self.alignment,
                isAlignmentSet: self.alignment != nil || view.viewConfiguration.isAlignmentSet
            )
        )
        return DefinedViewModifiedView(
            root: newRootView,
            configuration: view.configuration,
            content: view.content
        )
    }
}
