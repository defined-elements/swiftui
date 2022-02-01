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
    
    /// The swipe offset gesture state.
    @GestureState private var swipeOffset: CGFloat = 0
    
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
                                        Color.black.opacity(0.08)
                                            .edgesIgnoringSafeArea(.all)
                                            .transition(.opacity)
                                            .allowsHitTesting(false)
                                    }
                                }
                            )
                            .transition(i == 0
                                ? .opacity
                                : .offset(
                                    x: proxy.size.width - self.manager.offsets[i],
                                    y: 0
                                )
                            )
                            .zIndex(Double(i))
                            .visibility(show: self.manager.onAnimated && i >= self.manager.elements.count - 2)
                            .contentShape(Rectangle())
                    }
                } else {
                    EmptyView()
                }
            }
            .simultaneousGesture(
                DragGesture(coordinateSpace: .global)
                    .updating($swipeOffset) { (value, gestureState, transaction) in
                        let absolutePosition = value.startLocation.x - proxy.frame(in: .global).minX
                        if absolutePosition > 22 {
                            return
                        }
                        let delta = value.location.x - proxy.frame(in: .global).minX
                        if delta >= 0 {
                            gestureState = delta
                        } else {
                            gestureState = 0
                        }
                    }
                    .onEnded({ gesture in
                        let absolutePosition = gesture.startLocation.x - proxy.frame(in: .global).minX
                        if absolutePosition > 22 {
                            return
                        }
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
                    })
            )
            .onChange(of: self.swipeOffset, perform: { value in
                if self.manager.elements.count > 1 {
                    self.manager.offsets[self.manager.elements.count - 1] = value / 1.2
                    self.manager.offsets[self.manager.elements.count - 2] = -proxy.size.width / 4 + value / 4.8
                }
            })
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
