import Foundation
import SwiftUI

/// DefinedViewStack - 视图堆栈 @ DefinedElements
///
/// - TODO: Be able to use Stack multiple times (means multiple universal managers and controllers)
public struct DefinedViewStack : DefinedView {
    /// 页面堆栈管理器 < 环境变量 >
    ///
    /// 用于进行页面堆栈的管理，以及实现页面堆栈的交互动效
    @ObservedObject var manager: DefinedViewManager = DefinedViewManager.get()
    
    /// 视图空间 < 内部变量 >
    @Namespace private var space
    
    /// 默认页面进出动效 < 外部常量 >
    ///
    /// 从右侧滑入，从右侧滑出。下层View通过offset实现位移而非transition。
    public static var defaultTransition: AnyTransition {
        .move(edge: .trailing)
    }
    
    /// DefinedViewStack 构造器 - View
    ///
    /// - Parameter start: 底层视图
    public init<Content>(from start: Content) where Content: View {
        if self.manager.views.count > 0 {
            self.manager.renew()
        }
        self.manager.viewStack.push(DefinedPageElement(AnyView(start)))
    }
    
    /// DefinedViewStack 构造器 - AnyView
    ///
    /// - Parameter start: 底层视图
    public init(from start: AnyView) {
        if self.manager.views.count > 0 {
            self.manager.renew()
        }
        self.manager.viewStack.push(DefinedPageElement(start))
    }
    
    /// DefinedViewStack 构造器 - DefinedPage < 推荐构造器 >
    ///
    /// - Parameter start: 底层页面
    public init<Page>(from start: Page) where Page: DefinedPage {
        if self.manager.views.count > 0 {
            self.manager.renew()
        }
        self.manager.viewStack.push(DefinedPageElement(start))
    }
    
    // MARK: - Body
    
    ///
    public var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) { // MARK: View Part
                if self.manager.views.count >= 1 {
                    ForEach(0...self.manager.views.count-1, id: \.self) { i in
                        self.manager.views[i].content
                            .offset(x: i == self.manager.views.count - 1 || i == self.manager.views.count - 2 ? self.manager.offsets[i] : 0)
                            .matchedGeometryEffect(id: self.manager.views[i].id, in: self.space)
                            .overlay(
                                DefinedContent(.overlay) {
                                    if i == self.manager.views.count - 2 {
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
                            .hidden(when_to_show: self.manager.onAnimated && i >= self.manager.views.count - 2)
                    }
                } else {
                    EmptyView()
                }
            }
            .overlay( // MARK: Drag Part
                DefinedContent(.overlay, alignment: .leading) {
                    if self.manager.views.count > 1 {
                        Color.clear
                            .frame(width: 22)
                            .definedFullSize(.vertical, priorAlign: .leading)
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
                                        withAnimation(.easeInOut(duration: 0.12)) {
                                            self.manager.offsets[self.manager.views.count - 1] = gesture.location.x / 1.2
                                            self.manager.offsets[self.manager.views.count - 2] = -proxy.size.width / 4 + gesture.location.x / 4.8
                                        }
                                    })
                                    .onEnded({ gesture in
                                        if gesture.predictedEndTranslation.width > 150 {
                                            // TODO:
                                            self.manager.pop()
                                        } else {
                                            withAnimation(.easeInOut(duration: 0.15)) {
                                                self.manager.offsets[self.manager.views.count - 1] = 0
                                                self.manager.offsets[self.manager.views.count - 2] = -proxy.size.width / 4
                                            }
                                        }
                                    }),
                                including: .all
                            )
                    }
                }
                .definedSize(width: .full, height: .full, alignment: .leading)
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
        
    }
}
