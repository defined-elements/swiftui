#if os(iOS)

import Foundation
import SwiftUI

/// DefinedViewStack - 视图堆栈 @ DefinedElements
///
/// - TODO: Be able to use Stack multiple times (means multiple universal managers and controllers)
public struct DefinedViewStack : DefinedView {
    /// 页面堆栈管理器 < 环境变量 >
    ///
    /// 用于进行页面堆栈的管理，以及实现页面堆栈的交互动效
    @ObservedObject var manager: DefinedViewStackManager = DefinedViewStackManager.generate()
    
    /// 视图空间 < 内部变量 >
    @Namespace private var space
    
    /// DefinedViewStack 构造器 - DefinedPage < 推荐构造器 >
    ///
    /// - Parameters:
    ///   - from: The start page of this stack.
    internal init<StartPage>(from start: StartPage) where StartPage: DefinedPage {
        self.manager.viewStack.push(DefinedViewStackElement(start))
        DefinedViewManager.registerStack(
            manager: self.manager,
            parent: .base
        )
    }
    
    /// DefinedViewStack 构造器 - DefinedPage < 推荐构造器 >
    ///
    /// - Parameters:
    ///   - from: The start page of this stack.
    ///   - at: The parent page (the page holding this stack, NOT the root page of this stack).
    public init<StartPage, ParentPage>(
        from start: StartPage,
        at parent: ParentPage
    ) where StartPage: DefinedPage, ParentPage: DefinedPage {
        self.manager.viewStack.push(DefinedViewStackElement(start))
        DefinedViewManager.registerStack(
            manager: self.manager,
            parent: DefinedViewManager.find(parent).parent,
            under: DefinedViewManager.find(parent)
        )
    }
    
    // MARK: - Body
    
    ///
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
                                        Color.black.opacity(0.1)
                                            .edgesIgnoringSafeArea(.all)
                                            .transition(.opacity)
                                            .allowsHitTesting(false)
                                    } else {
                                        EmptyView()
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
            .overlay( // MARK: Drag Part
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
            // .mask(Color.black.opacity(self.manager.overallOpacity).animation(.easeInOut(duration: 0.30)).edgesIgnoringSafeArea(.all))
            .disabled(self.manager.onRootAnimated)
            .onAppear {
                self.manager.width = proxy.size.width
                self.manager.height = proxy.size.height
                self.manager.safeAreaInsets = proxy.safeAreaInsets
            }
        }
    }
    
    ///
    public func setStatusBarStyle(_ style: UIStatusBarStyle) {
        // TODO:
    }
}

#endif
