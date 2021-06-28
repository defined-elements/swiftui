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
    public static func register(manager stackManager: DefinedViewStackManager, parent: DefinedViewManagerRootElement) {
        let rootElement = DefinedViewManagerRootElement(docker: DefinedViewStackDocker(manager: stackManager),
                                                        parent: parent)
        
        if (stackManager.elements.first == nil) {
            // ERROR: no initial page!
            DefinedWarning.send(from: "DVManager", "the manager (stack manager) does not have any page inside!")
            return
        }
        
        let pageElement = DefinedViewManager.registerPage(id: stackManager.elements.first!.id, parent: rootElement)
        
        rootElement.hierarchy.append(pageElement)
        
        DefinedViewManager.instance.hierarchy.append(rootElement)
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
        DefinedViewManager.instance.pageMap.removeValue(forKey: id)
    }
}

#endif
