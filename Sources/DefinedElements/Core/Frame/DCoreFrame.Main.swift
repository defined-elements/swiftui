import SwiftUI

/// [DE]
public struct DefinedCoreFrame : DefinedView {
    @ObservedObject var router: DefinedCoreRouter
    
    public init(of router: DefinedCoreRouter) {
        self.router = router
    }
    
    public var body: some View {
        if (self.router.pages.count > 0) {
            ZStack() {
                ForEach(0...self.router.pages.count-1, id: \.self) { i in
                    if (
                        self.router.pages[i].persistent
                    ) {
                        self.router.pages[i].page
                            .visibility(show:
                                self.router.indicator != nil &&
                                self.router.indicator! == self.router.pages[i].tag
                            )
                            .zIndex( /* Use Z-Index to control the layer. */
                                (self.router.indicator != nil && self.router.indicator! == self.router.pages[i].tag) ? 0 : -1
                            )
                    } else {
                        if (
                            self.router.indicator != nil &&
                            self.router.indicator! == self.router.pages[i].tag
                        ) {
                            self.router.pages[i].page
                        }
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
}
