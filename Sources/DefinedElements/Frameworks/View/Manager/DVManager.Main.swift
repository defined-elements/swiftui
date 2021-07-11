#if os(iOS)

import Foundation
import SwiftUI

/// [DE Internal] A core manager controlling the view stack.
///
/// Should be attached to a `DefinedViewStack` for proper using.
///
/// - TODO: Reconsider the use case of making this public.
internal class DefinedViewManager {
    /// [DE Internal] Global instance of `DefinedViewManager`.
    static var instance = DefinedViewManager()
    
    /// An array containing all root elements.
    ///
    /// This array is designed for holding root elements in order to get a sense of stack pool.
    /// Each stack corresponds to a root element, so when we need to control or clean up, we can search from here.
    /// It is different from normal manager element because that corresponds to a page, which is the sub-item of our root element.
    var hierarchy: [DefinedViewManagerRootElement] = []
    
    /// A hash map containing all active pages.
    var pageMap: [UUID: DefinedViewManagerElement] = [:]
    
    /// [DE Internal] Register a `DefinedViewStack` into global manager.
    ///
    /// - Parameters:
    ///   - stackManager: The manager property of `DeefinedViewStack`.
    ///   - parent: The parent stack where this stack stands on.
    ///   - under: The page that this stack stands on. This is optional, but highly recommanded. If you registered a stack without associating the parent page `under` (not the parent stack), this stack and its pages will not be collected automatically when the parent page is destroyed.
    static func registerStack(
        manager stackManager: DefinedViewStackManager,
        parent: DefinedViewManagerRootElement,
        under: DefinedViewManagerElement? = nil
    ) {
        let rootElement = DefinedViewManagerRootElement(docker: DefinedViewStackDocker(manager: stackManager),
                                                        parent: parent)
        
        if (stackManager.elements.first == nil) {
            // ERROR: no initial page!
            DefinedWarning.send(from: "DVManager", "the manager (stack manager) does not have any page inside!")
            return
        }
        
        let pageElement = DefinedViewManager.registerPage(id: stackManager.elements.first!.id, parent: rootElement)
        rootElement.hierarchy.append(pageElement)
        under?.register(rootElement)
        DefinedViewManager.instance.hierarchy.append(rootElement)
    }
    
    /// [DE Internal] Unregister a `DefinedViewStack` into global manager.
    ///
    /// - Parameter root: The root element of the stack you want to unregister. You can get the root element by `DefinedViewManager.find(page).parent` where `page` could be any page on this stack.
    static func unregisterStack(root: DefinedViewManagerRootElement) {
        DefinedViewManager.instance.hierarchy.removeAll(where: { curr in
            if curr == root {
                for page in curr.hierarchy {
                    DefinedViewManager.unregisterPage(id: page.id)
                }
                return true
            }
            return false
        })
    }
    
    /// [DE Internal] Find the page manager by given page id.
    ///
    /// - Parameter id: The page id.
    /// - Returns: The page manager corresponding to the given page id.
    ///
    /// - Note: It will return a dummy and generate a warning if we cannot find it in order to not break the program.
    static func find(_ id: UUID) -> DefinedViewManagerElement {
        guard let element = DefinedViewManager.instance.pageMap[id] else {
            DefinedWarning.send(from: "DVManager", "cannot find the page manager by given page id.")
            return .dummy
        }
        return element
    }
    
    /// [DE Internal] Find the page manager by given page instance.
    ///
    /// - Parameter page: The `DefinedPage` instance.
    /// - Returns: The page manager corresponding to the given page.
    ///
    /// - Note: It will return a dummy and generate a warning if we cannot find it in order to not break the program.
    static func find<Page>(_ page: Page) -> DefinedViewManagerElement where Page: DefinedPage {
        guard let element = DefinedViewManager.instance.pageMap[page.id] else {
            DefinedWarning.send(from: "DVManager", "cannot find the page manager by given DefinedPage.")
            return .dummy
        }
        return element
    }
    
    /// [DE Internal] Register a `DefinedPage` into global manager.
    ///
    /// This may be called automatically.
    ///
    /// - Parameters:
    ///   - id: The id of the `DefinedPage` being registered.
    ///   - parent: The root element of the stack where this page is in.
    /// - Returns: The newly created page manager corresponding to the page that is just registered.
    static func registerPage(id: UUID, parent: DefinedViewManagerRootElement) -> DefinedViewManagerElement {
        let pageElement = DefinedViewManagerElement(id: id, parent: parent)
        DefinedViewManager.instance.pageMap[id] = pageElement
        return pageElement
    }
    
    /// [DE Internal] Unregister a `DefinedPage` from global manager.
    ///
    /// This may be called automatically for safely collecting the unavailable pages.
    ///
    /// - Parameters:
    ///   - id: The id of the `DefinedPage` being unregistered.
    static func unregisterPage(id: UUID) {
        guard let page = DefinedViewManager.instance.pageMap.removeValue(forKey: id) else {
            DefinedWarning.send(from: "DVManager", "the page being unregistered does not exist!")
            return
        }
        page.unregister()
    }
}

#endif
