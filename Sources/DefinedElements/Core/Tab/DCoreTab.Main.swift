import SwiftUI

/// [DE] A core tab bar with item choices and associated display.
///
/// - TODO: Support pictures.
/// - TODO: Customize background.
public struct DefinedCoreTab<Content: View> : DefinedView {
    typealias Item = DefinedCoreItem
    
    private let NAVI_HEIGHT: CGFloat = 85
    private let NAVI_SIDE_PADDING: CGFloat = 4
    private let NAVI_BOTTOM_OFFSET: CGFloat = 1
        
    private var content: () -> Content
    
    /// [DE] Associated router of a core tab group.
    ///
    /// This binding will mainly be used on displaying current fragment.
    @ObservedObject var router: DefinedCoreRouter
    
    /// [DE Internal] The index of starting page.
    private var startIndex: Int
    
    /// [DE Internal] The background of this core tab bar.
    private var background: AnyView = AnyView(DefinedBlurBackground())
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            DefinedDivider()
            
            HStack(alignment: .center, spacing: 0) {
                // Process content dynamically.
                process(self.content)
            }
            .padding(.bottom, NAVI_BOTTOM_OFFSET)
            .frame(maxWidth: .infinity, maxHeight: NAVI_HEIGHT)
            .padding(.horizontal, NAVI_SIDE_PADDING)
            .background(background.edgesIgnoringSafeArea(.bottom))
        }
    }
    
    /// [DE] 
    public init(
        of routerBase: DefinedCoreRouter? = nil,
        start: Int = 0,
        @ViewBuilder cont: @escaping () -> Content
    ) {
        self.startIndex = start
        self.content = cont
        if (routerBase != nil) {
            self.router = routerBase!
        } else {
            self.router = .init()
        }
    }
}

extension DefinedCoreTab {
    /// [DE Internal] Process the core tab content.
    func process(_ content: () -> Content) -> some View {
        let body = content()
        let a = Group {
            if (body is Item) {
                processor(body as! Item)
            } else if (body is TupleView<(Item, Item)>) {
                processor(body as! TupleView<(Item, Item)>)
            } else if (body is TupleView<(Item, Item, Item)>) {
                processor(body as! TupleView<(Item, Item, Item)>)
            } else if (body is TupleView<(Item, Item, Item, Item)>) {
                processor(body as! TupleView<(Item, Item, Item, Item)>)
            } else if (body is TupleView<(Item, Item, Item, Item, Item)>) {
                processor(body as! TupleView<(Item, Item, Item, Item, Item)>)
            } else {
                body
            }
        }
        return a
    }
    
    func processor(_ view: Item) -> some View {
        let (v1) = view
        return build([v1], indicator: self.$router.indicator)
    }
    
    func processor(_ view: TupleView<(Item, Item)>) -> some View {
        let (v1, v2) = view.value
        return build([v1, v2], indicator: self.$router.indicator)
    }
    
    func processor(_ view: TupleView<(Item, Item, Item)>) -> some View {
        let (v1, v2, v3) = view.value
        return build([v1, v2, v3], indicator: self.$router.indicator)
    }
    
    func processor(_ view: TupleView<(Item, Item, Item, Item)>) -> some View {
        let (v1, v2, v3, v4) = view.value
        return build([v1, v2, v3, v4], indicator: self.$router.indicator)
    }
    
    func processor(_ view: TupleView<(Item, Item, Item, Item, Item)>) -> some View {
        let (v1, v2, v3, v4, v5) = view.value
        return build([v1, v2, v3, v4, v5], indicator: self.$router.indicator)
    }
    
    ///
    func build(_ views: [Item], indicator: Binding<String?>) -> some View {
        self.router.add(list: views)
        let buildOutput = Group {
            ForEach((0...views.count-1), id: \.self) { i in
                Spacer()
                views[i].build(indicator: indicator)
            }
            Spacer()
            
            // TODO: Blinking Bug?? Cannot reproduce for now.
        }
        return buildOutput.onAppear(perform: {
            self.router.indicator = views[self.startIndex].linked.tag
          })
    }
}

