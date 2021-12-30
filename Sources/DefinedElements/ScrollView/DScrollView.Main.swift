import SwiftUI

/// DefinedScrollView - 滚动视图 @ DefinedElements
///
/// - Bug:
///   已知原因，较为严重。存在动画或震动的时候可能会导致高度计算延迟。
///
/// - TODO: 支持无Cover状态
/// - TODO: 支持CoverHeader
public struct DefinedScrollView : DefinedView {
    /// 滚动组件数据观察器 < 内部变量 >
    @ObservedObject var obs: ScrollObserver = ScrollObserver()
    
    ///
    @State var contentOffset: CGPoint = .zero
    
    ///
    @State var coverOffset: CGFloat = 0
    
    ///
    @State var coverHeight: CGFloat = 0
    
    ///
    @State var pageHeight: CGFloat = 0
    
    /// 核心内容区域 < 内部变量 >
    private var content: AnyView = AnyView(EmptyView())
    
    ///
    private var pageId: UUID
    
    // MARK: - Constructors
    // Constructors are using dynamic dispatch.
        
    /// < 内部构造器 >
    private init(
        _ direction: ScrollDirection = .vertical,
        _ pageId: UUID
    ) {
        self.pageId = pageId
        self.obs.direction = direction
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0: View
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> V0
    ) {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0: View,
        V1: View
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1)>
    ) {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0: View,
        V1: View,
        V2: View
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1, V2)>
    ) {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0: View,
        V1: View,
        V2: View,
        V3: View
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1, V2, V3)>
    ) {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0: View,
        V1: View,
        V2: View,
        V3: View,
        V4: View
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1, V2, V3, V4)>
    ) {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0, V1, V2, V3, V4, V5
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1, V2, V3, V4, V5)>
    ) where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0, V1, V2, V3, V4, V5, V6
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1, V2, V3, V4, V5, V6)>
    ) where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0, V1, V2, V3, V4, V5, V6, V7
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1, V2, V3, V4, V5, V6, V7)>
    ) where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View, V7: View {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0, V1, V2, V3, V4, V5, V6, V7, V8
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1, V2, V3, V4, V5, V6, V7, V8)>
    ) where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View, V7: View, V8: View {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    /// DefinedScrollView 构造器 < 外部构造器 >
    ///
    /// - Parameters:
    ///   - direction: 滚动方向（未来支持横向及纵向，但目前只开发完了纵向）
    ///   - content: 视图生成器
    public init<
        V0, V1, V2, V3, V4, V5, V6, V7, V8, V9
    >(
        _ direction: ScrollDirection = .vertical,
        at pageId: UUID,
        @ViewBuilder content: @escaping () -> TupleView<(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9)>
    ) where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View, V7: View, V8: View, V9: View {
        self.init(direction, pageId)
        self.content = AnyView(processor(content()))
    }
    
    // MARK: - Body
    
    public var body: some View {
        ZStack(alignment: .top) {
            /* 封面背景 */
            DefinedContent(.overlay) {
                self.obs.cover_background
                    .edgesIgnoringSafeArea(.top)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: self.coverHeight)
            .defined(exceed_safe_area: self.obs.safeAreaTracker.getSafeAreaSetup())
            
            /* 滚动主体 */
            ScrollView(self.obs.direction.axisSet()) {
                VStack(alignment: .center, spacing: 0) {
                    // 滚动捕捉器 零空间
                    ScrollReader(self.$contentOffset)
                        .frame(height: 0)
                        .offset(y: (self.obs.safeAreaTracker.top ? 0 : -DefinedViewManager.find(pageId).getViewStackInformation().safeAreaInsets.top))
                    
                    // 封面内容
                    ZStack {
                        ZStack(alignment: self.obs.coverPosition.get()) {
                            /* 封面触摸背景 */
                            self.obs.cover_touchBackground
                                .definedSize(width: .full, height: .full)
                            
                            /* 封面内容 */
                            if self.obs.cover != nil {
                                self.obs.cover!
                                    .definedSize(width: .full, height: self.obs.coverHeight_default)
                                    .definedSize(
                                        width: .full,
                                        height: .full,
                                        alignment: self.obs.coverPosition.get()
                                    )
                            }
                        }
                        .frame(height: self.coverHeight)
                        .offset(y: self.coverOffset)
                    }
                    .frame(height: self.obs.coverHeight_default)

                    // 正文内容
                    LazyVStack(alignment: .center, spacing: 0) {
                        content
                    }
                    .definedSize(width: .full)
                    
                    // TODO: 底部内Padding
                }
                .defined(exceed_safe_area: self.obs.safeAreaTracker.getSafeAreaSetup())
                .disabled(self.contentOffset.x < 0.0 || self.contentOffset.y < 0.0)
                /* 滚动追踪系统初始化 */
                .onAppear {
                    self.onOffsetUpdated(0)
                }
            }
            .definedSize(width: .full, height: .full)
            /* DefinedView 嵌入式安全区域扩展支持 */
            .defined(exceed_safe_area: self.obs.safeAreaTracker.getSafeAreaSetup())
            /* 滚动追踪系统捕捉回调 */
            .onChange(of: self.contentOffset, perform: { value in
                self.onOffsetUpdated(value.y)
            })
            
            /* 顶栏 */
            if self.obs.header != nil {
                self.obs.header!
            }
        }
    }
    
    // MARK: - Offset Updater
    
    /// < 内部函数 >
    private func onOffsetUpdated(_ offset: CGFloat) {
        // 动态布局
        if (offset <= 0) {
            if (-offset < DefinedViewManager.find(pageId).getViewStackInformation().height - self.obs.coverHeight_default) {
                self.coverHeight = self.obs.coverHeight_default - offset
                self.coverOffset = offset / 2
            }
        } else if (offset > self.obs.coverHeight_default) {
            self.coverHeight = 0
            self.coverOffset = 0
        } else {
            self.coverHeight = self.obs.coverHeight_default - offset
            self.coverOffset = 0
        }

        // Header组件滚动回调
        if self.obs.header != nil {
            self.obs.header!.callOnScroll(offset)
        }

        // 额外回调
        self.obs.onScrollingCallback(offset)
    }
    
    // MARK: - Embeded Processors
    // Processors are using dynamic dispatch.
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0>(_ view: V0) -> some View where V0 : View {
        if let v = view as? DefinedCover {
            self.setCover(v)
        } else if let v = view as? DefinedHeader {
            self.obs.header = v
        }
        return Group {
            if (view is DefinedCover || view is DefinedHeader) {
                EmptyView()
            } else {
                view
            }
        }
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1>(_ view: TupleView<(V0, V1)>) -> some View where V0: View, V1: View {
        let (v0, v1) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1))
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1, V2>(_ view: TupleView<(V0, V1, V2)>) -> some View where V0: View, V1: View, V2: View {
        let (v0, v1, v2) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1),
                                      processor(v2))
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1, V2, V3>(_ view: TupleView<(V0, V1, V2, V3)>) -> some View where V0: View, V1: View, V2: View, V3: View {
        let (v0, v1, v2, v3) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1),
                                      processor(v2),
                                      processor(v3))
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1, V2, V3, V4>(_ view: TupleView<(V0, V1, V2, V3, V4)>) -> some View where V0: View, V1: View, V2: View, V3: View, V4: View {
        let (v0, v1, v2, v3, v4) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1),
                                      processor(v2),
                                      processor(v3),
                                      processor(v4))
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1, V2, V3, V4, V5>(_ view: TupleView<(V0, V1, V2, V3, V4, V5)>) -> some View where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View {
        let (v0, v1, v2, v3, v4, v5) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1),
                                      processor(v2),
                                      processor(v3),
                                      processor(v4),
                                      processor(v5))
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1, V2, V3, V4, V5, V6>(_ view: TupleView<(V0, V1, V2, V3, V4, V5, V6)>) -> some View where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View {
        let (v0, v1, v2, v3, v4, v5, v6) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1),
                                      processor(v2),
                                      processor(v3),
                                      processor(v4),
                                      processor(v5),
                                      processor(v6))
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1, V2, V3, V4, V5, V6, V7>(_ view: TupleView<(V0, V1, V2, V3, V4, V5, V6, V7)>) -> some View where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View, V7: View {
        let (v0, v1, v2, v3, v4, v5, v6, v7) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1),
                                      processor(v2),
                                      processor(v3),
                                      processor(v4),
                                      processor(v5),
                                      processor(v6),
                                      processor(v7))
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1, V2, V3, V4, V5, V6, V7, V8>(_ view: TupleView<(V0, V1, V2, V3, V4, V5, V6, V7, V8)>) -> some View where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View, V7: View, V8: View {
        let (v0, v1, v2, v3, v4, v5, v6, v7, v8) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1),
                                      processor(v2),
                                      processor(v3),
                                      processor(v4),
                                      processor(v5),
                                      processor(v6),
                                      processor(v7),
                                      processor(v8))
    }
    
    /// 视图处理器 < 内部函数 >
    private func processor<V0, V1, V2, V3, V4, V5, V6, V7, V8, V9>(_ view: TupleView<(V0, V1, V2, V3, V4, V5, V6, V7, V8, V9)>) -> some View where V0: View, V1: View, V2: View, V3: View, V4: View, V5: View, V6: View, V7: View, V8: View, V9: View {
        let (v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = view.value
        return ViewBuilder.buildBlock(processor(v0),
                                      processor(v1),
                                      processor(v2),
                                      processor(v3),
                                      processor(v4),
                                      processor(v5),
                                      processor(v6),
                                      processor(v7),
                                      processor(v8),
                                      processor(v9))
    }
    
    // MARK: - Builder
    
    // TODO: 未来可能会开发，用于节约视图层级
    
    ///
    private func builder() -> some View {
        return EmptyView()
    }
    
    /// < 内部函数 >
    func setCover(_ cover: DefinedCover) {
        self.obs.coverHeight = cover.obs.height
        self.obs.coverHeight_default = cover.obs.height
        self.obs.cover = cover
        self.obs.cover_background = cover.obs.background
        self.obs.cover_touchBackground = cover.obs.touchBackground
        self.obs.coverPosition = cover.obs.position
        self.obs.cover_showDivider = cover.obs.divider
    }
    
    // MARK: - Header Functions
    
    /// < 视图函数 >
    public func header(back: _BackButtonConfiguration, title: String) -> Self {
        self.obs.header = DefinedHeader(back: back, title: DefinedTitle(title, header: true))
            .setCoverHeight(self.obs.coverHeight_default)
        return self
    }
    
    /// < 推荐视图函数 >
    public func header(_ header: DefinedHeader) -> Self {
        self.obs.header = header.setCoverHeight(self.obs.coverHeight_default)
        return self
    }
    
    /// < 视图函数 >
    public func header<Header>(@ViewBuilder _ header: @escaping (CGFloat) -> Header) -> Self where Header: View {
        self.obs.header = DefinedHeader(header).setCoverHeight(self.obs.coverHeight_default)
        return self
    }
    
    // MARK: - Cover Functions
    
    /// < 视图函数 >
    public func cover(_ cover: DefinedCover) -> Self {
        self.setCover(cover)
        return self
    }
    
    // MARK: - Setting Functions
    
    /// 滚动监视函数 < 外部函数 >
    ///
    /// 在DefinedScrollView滚动时将自动执行的函数
    ///
    /// ```
    /// DefinedScrollView(...) {
    ///     ...
    /// }.onScrolling { offset in // scroll offset
    ///     ... // the things you are going to do
    /// }
    /// ```
    ///
    /// - Important: 滚动发生时，该函数将被反复回调，并非只回调一次！
    ///
    /// - Bug: 目前滚动回调数据会有稍许延迟（尤其是在回调后的动态布局上尤为明显），为已知问题
    ///
    /// - Parameters:
    ///   - perform: 传入待执行的函数，函数变量为滚动高度，默认为0
    ///   - offset: 滚动高度（动态回调）
    public func onScrolling(_ perform: @escaping (_ offset: CGFloat) -> Void) -> Self {
        self.obs.onScrollingCallback = perform
        return self
    }
    
    ///
    public func exceedSafeArea(
        exceed_safe_area setup: DefinedSafeAreaConfiguration
    ) -> Self {
        self.obs.safeAreaTracker.setSafeAreaSetup(setup)
        return self
    }
}
