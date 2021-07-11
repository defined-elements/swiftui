#if os(iOS)

import Foundation
import SwiftUI

/// [DE] A view stack holding `DefinedPage`.
///
/// - BUG: Swipe over-edge bug.
/// - BUG: Swipe back gesture detection is not perfect.
public struct DefinedViewStack : DefinedView {
    
    /// A manager controlling the view stack.
    ///
    /// Should be observed and generate from `DVStackManager` global instance.
    /// To be used on managing pages and interactions.
    @ObservedObject var manager: DefinedViewStackManager
    
    /// The name of this `DefinedViewStack`.
    ///
    /// Should be unique per page (if there are multiple embeded view stacks in one page).
    private var name: String
    
    /// The parent page id of this `DefinedViewStack`.
    private var parentId: UUID
    
    /// The namespace for this view stack.
    @Namespace private var space
    
    /// [DE Internal] Create a view stack by given start page.
    ///
    /// This should be used internally on starting the app (the root stack).
    ///
    /// - Parameters:
    ///   - from: The start page of this stack.
    internal init<StartPage>(from start: StartPage) where StartPage: DefinedPage {
        self.name = "DVStackCoreRootInternal"
        self.parentId = DefinedViewStackManager.rootId
        
        let shouldRegister = DefinedViewStackManager.shouldRegister(name: name, pageId: parentId)
        self.manager = DefinedViewStackManager.get(
            name: "DVStackCoreRootInternal",
            pageId: parentId,
            shouldUseStatusBar: true
        )
        
        if shouldRegister {
            self.manager.viewStack.push(DefinedViewStackElement(start))
            DefinedViewManager.registerStack(
                manager: self.manager,
                parent: .base
            )
        }
    }
    
    /// [DE] Create a view stack by given start page and the parent page.
    ///
    /// This should be used on developing a stack in another page.
    ///
    /// - Parameters:
    ///   - name: The name of the view stack.
    ///   - from: The start page of this stack.
    ///   - at: The parent page (the page holding this stack, NOT the root page of this stack).
    ///   - statusBar: True if this stack should change the status bar style while directing. (optional, default false)
    public init<StartPage, ParentPage>(
        name: String,
        from start: StartPage,
        at parent: ParentPage,
        statusBar shouldUseStatusBar: Bool = false
    ) where StartPage: DefinedPage, ParentPage: DefinedPage {
        self.name = name
        self.parentId = parent.id
        
        let shouldRegister = DefinedViewStackManager.shouldRegister(name: name, pageId: parentId)
        self.manager = DefinedViewStackManager.get(name: name, pageId: parentId, shouldUseStatusBar: shouldUseStatusBar)
                
        if shouldRegister {
            self.manager.viewStack.push(DefinedViewStackElement(start))
            DefinedViewManager.registerStack(
                manager: self.manager,
                parent: DefinedViewManager.find(parent).parent,
                under: DefinedViewManager.find(parent)
            )
        }
    }
    
    // MARK: - Body
    
    /// The core body view of this view stack.
    public var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) { // MARK: View Part
                if self.manager.elements.count >= 1 {
                    ForEach(0...self.manager.elements.count-1, id: \.self) { i in
                        self.manager.elements[i].content
                            .offset(x: i == self.manager.elements.count - 1 || i == self.manager.elements.count - 2 ? self.manager.offsets[i] : 0)
                            .matchedGeometryEffect(id: self.manager.elements[i].id, in: self.space)
                            .overlay(
                                DefinedContent(.overlay) {
                                    if i == self.manager.elements.count - 2 {
                                        Color.black.opacity(0.06)
                                            .edgesIgnoringSafeArea(.all)
                                            .transition(.opacity)
                                            .allowsHitTesting(false)
                                    }
                                }
                            )
                            .transition(i == 0 ? .opacity : .move(edge: .trailing))
                            .zIndex(Double(i))
                            .visibility(show: self.manager.onAnimated && i >= self.manager.elements.count - 2)
                    }
                } else {
                    EmptyView()
                }
            }
            .overlay(
                // MARK: Drag Part
                // TODO: make drag better
                DefinedContent(.overlay, alignment: .leading) {
                    if self.manager.elements.count > 1 {
                        Color.clear
                            .frame(width: 22)
                            .frame(maxHeight: .infinity, alignment: .leading)
                            .background(Color.blue.opacity(0))
                            .contentShape(Rectangle())
                            .simultaneousGesture(
                                LongPressGesture(minimumDuration: 0.01)
                                    .onEnded({ gesture in
                                        // do nothing
                                    }),
                                including: .all
                            )
                            .simultaneousGesture(
                                DragGesture(coordinateSpace: .local)
                                    .onChanged({ gesture in
                                        if self.manager.elements.count > 1 {
                                            withAnimation(.easeInOut(duration: 0.12)) {
                                                self.manager.offsets[self.manager.elements.count - 1] = gesture.location.x / 1.2
                                                self.manager.offsets[self.manager.elements.count - 2] = -proxy.size.width / 4 + gesture.location.x / 4.8
                                            }
                                        }
                                    })
                                    .onEnded({ gesture in
                                        if gesture.predictedEndTranslation.width > 150 {
                                            // call the main manager to pop instead of popping from stack manager directly.
                                            // unregister the page and pop from current stack.
                                            DefinedViewManager.find(self.manager.elements.last!.id).back()
                                        } else {
                                            if self.manager.elements.count > 1 {
                                                withAnimation(.easeInOut(duration: 0.15)) {
                                                    self.manager.offsets[self.manager.elements.count - 1] = 0
                                                    self.manager.offsets[self.manager.elements.count - 2] = -proxy.size.width / 4
                                                }
                                            }
                                        }
                                    }),
                                including: .all
                            )
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            )
            .disabled(self.manager.onRootAnimated)
            .onAppear {
                self.manager.width = proxy.size.width
                self.manager.height = proxy.size.height
                self.manager.safeAreaInsets = proxy.safeAreaInsets
            }
        }
    }
}

#endif
