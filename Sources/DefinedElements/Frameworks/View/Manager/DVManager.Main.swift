#if os(iOS)

import Foundation
import SwiftUI

/// [DE Internal] A core manager controlling the view stack.
///
/// Should be attached to a `DefinedViewStack` for proper using.
class DefinedViewManager : DefinedPotentialWarning {
    var name: String = "DefinedViewManager"
    
    ///
    static var instance = DefinedViewManager()
    
    ///
    var hierarchy: [DefinedViewManagerRootElement] = []
    
    ///
    var pageMap: [UUID: DefinedViewManagerElement] = [:]
    
    ///
    public static func registerStack(
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
        
        if (under != nil) {
            under!.register(rootElement)
        }
        
        DefinedViewManager.instance.hierarchy.append(rootElement)
    }
    
    ///
    public static func unregisterStack(root: DefinedViewManagerRootElement) {
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
    
    ///
    public static func find(_ id: UUID) -> DefinedViewManagerElement {
        return DefinedViewManager.instance.pageMap[id] ?? .dummy
    }
    
    ///
    public static func find<Page>(_ page: Page) -> DefinedViewManagerElement where Page: DefinedPage {
        return DefinedViewManager.instance.pageMap[page.id] ?? .dummy
    }
    
    ///
    internal static func registerPage(id: UUID, parent: DefinedViewManagerRootElement) -> DefinedViewManagerElement {
        let pageElement = DefinedViewManagerElement(id: id, parent: parent)
        DefinedViewManager.instance.pageMap[id] = pageElement
        return pageElement
    }
    
    internal static func unregisterPage(id: UUID) {
        guard let page = DefinedViewManager.instance.pageMap.removeValue(forKey: id) else {
            return
        }
        page.unregister()
    }
}

#endif
