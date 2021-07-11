#if os(iOS)

import Foundation
import SwiftUI

/// [DE Internal] A view stack element holder using for `DefinedViewStack`.
///
/// - Note: The reason why we do NOT use generic type for `DefinedPage` is we will not be able to define an array of this.
/// - Note: We should use `class` instead of `struct` to avoid unwanted re-init of the values.
internal class DefinedViewStackElement : Identifiable, Equatable {
    /// [Deprecated]
    ///
    /// This may be deprecated. It is used to make sure that the newer page is always above the elder page.
    /// We need to make sure that the z-index things are not affected by multiple stacks support before removing this.
    /// Everytime we create a new stack element, it self-increases.
    private static var constantLevel: Int = 0
    
    /// The id of the page held by this stack element.
    let id: UUID
    
    /// The level of this stack element.
    ///
    /// It should obtained automatically from `constantLevel` property.
    let level: Int
    
    /// The page held by this stack element.
    let content: AnyView
    
    /// The status bar setup of this page (held by this stack element).
    ///
    /// This property will be modified synchronously when the `statusBarStyle` property of the page has been changed.
    var statusBarStyle: UIStatusBarStyle
    
    /// [DE Internal] Create a ViewStack element by given page.
    ///
    /// - Parameter page: The page for this stack element.
    init<Page>(_ page: Page) where Page: DefinedPage {
        self.id = page.id
        self.level = DefinedViewStackElement.constantLevel
        self.content = AnyView(page)
        self.statusBarStyle = page.statusBarStyle
        
        DefinedViewStackElement.constantLevel += 1
    }

    /// Compare to ViewStack Element by comparing their page id.
    ///
    /// When page ids are the same, they should be the same element. Otherwise, there is a bug.
    static func == (lhs: DefinedViewStackElement, rhs: DefinedViewStackElement) -> Bool {
        return lhs.id == rhs.id
    }
}

#endif
