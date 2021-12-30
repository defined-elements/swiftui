import SwiftUI

///
class ScrollObserver : ObservableObject {
    
    @Namespace var scrollSpace
    
    // MARK: - Views
    
    ///
    @Published var header: DefinedHeader? = nil
    
    ///
    @Published var cover: DefinedCover? = nil
    
    ///
    @Published var cover_background: AnyView = AnyView(EmptyView())
    
    ///
    @Published var cover_touchBackground: AnyView = AnyView(EmptyView())
    
    // MARK: - Values
    
    ///
    @Published var coverHeight: CGFloat = 0
    
    ///
    @Published var coverHeight_default: CGFloat = 0
    
    ///
    @Published var coverOffset: CGFloat = 0
    
    ///
    @Published var coverPosition: CoverPosition = .center
    
    ///
    @Published var cover_showDivider: Bool = true
    
    ///
    @Published var direction: ScrollDirection = .vertical
    
    ///
    @Published var safeAreaTracker = DefinedSafeAreaTracker()
    
    // MARK: - Callbacks
    
    ///
    @Published var onScrollingCallback: (CGFloat) -> Void = { height in /* do nothing */ }
}
