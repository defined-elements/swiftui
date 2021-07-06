import Foundation

/// [DE] A controller managing the page and all of its functionalities.
///
/// You should only use this on your `DefinedPage`, like:
///
/// ``` swift
/// var controller: DefinedPageController = .init()
/// ```
public class DefinedPageController {
    /// The page id associated with the controlled page.
    ///
    /// Should be internal only.
    internal let id: UUID = UUID()
    
    /// [DE] Simply create a normal PageController.
    public init() {
        // do nothing.
    }
    
    /// [DE] Link to another page.
    ///
    /// Link means going to the next level (sub-page/child-page).
    /// The current page will be the ancestor of the target page.
    ///
    /// - Note: Please be aware that when you are executing `link(to:)`, you are adding a page onto the stack that this page is at. It is NOT adding the new page directly above the this page (if you mean to insert, then it is NOT). So when you are executing this outside the current page, you need to make sure where the target page will be.
    ///
    /// - Requires: The target page should conform to ``DefinedPage`` protocol.
    ///
    /// - Parameters:
    ///   - target: The target page.
    public func link<Page>(to target: Page) where Page: DefinedPage {
        DefinedViewManager.find(self.id).link(to: target)
    }
    
    /// [DE] Back to the previous page.
    ///
    /// Back means pop up the current page and step back to the previous level.
    /// The current page will be destroyed and collected.
    ///
    /// - Note: Please be aware that when you are executing `back()`, you are poping the top page of the stack that this page is at. It is NOT poping current page wherever it is. So when you are executing this outside the current page, you need to make sure which page will be popped.
    public func back() {
        DefinedViewManager.find(self.id).back()
    }
    
    /// [DE] Jump to another page.
    ///
    /// Jump means cleaning the entire view stack and put target page at the new first level.
    /// The current page will be destroyed and collected.
    /// And you are not able to use `back()` because the target page becomes the first level page and there is no way to go back from the first level page.
    ///
    /// - Note: Please be aware that when you are executing `jump(to:)`, you are putting target page to the stack that this page is at and replace all old pages. The risk may be that the page you are at will be destroyed and collected since the original stack (whatever embeded or not) is cleaned. And if you are doing this to another stack that differs from the stack you are at, you also have to know that the page may not display per following the hierarchy, but it actually executed. So when you are executing this outside the current page, you need to make sure where the target page will be.
    ///
    /// - Requires: The target page should conform to ``DefinedPage`` protocol.
    ///
    /// - Parameters:
    ///   - target: The target page.
    public func jump<Page>(to target: Page) where Page: DefinedPage {
        DefinedViewManager.find(self.id).jump(to: target)
    }
}
