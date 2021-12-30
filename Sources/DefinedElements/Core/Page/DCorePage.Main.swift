import SwiftUI

/// [DE] A protocol for core page using in `DefinedCoreItem`.
public protocol DefinedCorePage {
    var tag: String { get }
    
    /// [DE] Keeping states?
    ///
    /// Should we keep the information while switching from current page to another page.
    ///
    /// - Default: true
    var persistent: Bool { get }
    
    /// [DE Internal] An `AnyView` instance of this page itself.
    ///
    /// Generally, you do not need to implement it!
    var page: AnyView { get }
}

public extension DefinedCorePage {
    var persistent: Bool { true }
    
    func equals(_ target: DefinedCorePage) -> Bool {
        return self.tag == target.tag
    }
}

public extension DefinedCorePage where Self: DefinedPage {
    var page: AnyView {
        AnyView(self)
    }
}
