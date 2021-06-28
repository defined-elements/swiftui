#if os(iOS)

import Foundation

/// [DE Internal]
internal class DefinedViewManagerElement : Equatable {
    var id: UUID
    
    var parent: DefinedViewManagerRootElement
    
    var stacks: [DefinedViewManagerRootElement] = []
    
    init(id: UUID, parent: DefinedViewManagerRootElement) {
        self.id = id
        self.parent = parent
    }

    func link<Page>(to target: Page) where Page: DefinedPage {
        parent.link(to: target)
    }
    
    func jump<Page>(to target: Page) where Page: DefinedPage {
        parent.jump(to: target)
    }
    
    func swap<Page>(with target: Page) where Page: DefinedPage {
        parent.swap(with: target)
    }
    
    func back() {
        parent.back()
    }
    
    func register(_ root: DefinedViewManagerRootElement) {
        self.stacks.append(root)
    }
    
    func unregister() {
        for r in stacks {
            DefinedViewManager.unregisterStack(root: r)
        }
    }
    
    static func == (lhs: DefinedViewManagerElement, rhs: DefinedViewManagerElement) -> Bool {
        return lhs.id == rhs.id
    }
}

extension DefinedViewManagerElement {
    ///
    static let dummy: DefinedViewManagerElement = DefinedViewManagerDummyElement()
}

internal class DefinedViewManagerDummyElement : DefinedViewManagerElement {
    init() {
        super.init(id: UUID(), parent: .dummy)
    }
    
    override func link<Page>(to target: Page) where Page: DefinedPage {
        // do nothing.
    }
}

internal class DefinedViewManagerRootElement : DefinedPotentialWarning, Equatable {
    var id: UUID = UUID()
    
    var name: String = "DVManagerRootElement"
    
    var hierarchy: [DefinedViewManagerElement] = []
        
    var docker: DefinedViewStackDocker? = nil
    var parent: DefinedViewManagerRootElement? = nil
    
    fileprivate init(docker: DefinedViewStackDocker? = nil, parent: DefinedViewManagerRootElement? = nil) {
        self.docker = docker
        self.parent = parent
    }
    
    init(docker: DefinedViewStackDocker, parent: DefinedViewManagerRootElement) {
        self.docker = docker
        self.parent = parent
    }
    
    func link<Page>(to target: Page) where Page: DefinedPage {
        if (self.docker == nil) {
            // ERROR
            return
        }
        self.docker!.link(to: target)
        
        self.hierarchy.append(DefinedViewManager.registerPage(id: target.id, parent: self))
    }
    
    func jump<Page>(to target: Page) where Page: DefinedPage {
        if (self.docker == nil) {
            // ERROR
            return
        }
        self.docker!.jump(to: target)
    }
    
    func swap<Page>(with target: Page) where Page: DefinedPage {
        if (self.docker == nil) {
            // ERROR
            return
        }
        self.docker!.swap(with: target)
    }
    
    func back() {
        if (self.docker == nil) {
            // ERROR
            warning("docker is null")
            return
        }
        if (hierarchy.count > 1) {
            self.docker!.back()
            let last = self.hierarchy.removeLast()
            DefinedViewManager.unregisterPage(id: last.id)
        } else {
            // TODO: back the parent page if back-parent enabled.
            // TODO: implement back-parent feature.
        }
    }
    
    static func == (lhs: DefinedViewManagerRootElement, rhs: DefinedViewManagerRootElement) -> Bool {
        return lhs.id == rhs.id
    }
}

extension DefinedViewManagerRootElement {
    ///
    internal static let base = DefinedViewManagerRootElement()
    
    ///
    fileprivate static let dummy = DefinedViewManagerRootElement()
}

internal class DefinedViewManagerRoot: DefinedViewManagerRootElement {
    init(docker: DefinedViewStackDocker) {
        super.init(docker: docker)
    }
    
    override func back() {
        //
    }
}

#endif
