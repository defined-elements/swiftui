import SwiftUI

/// [DE] The router for `DefinedCoreTab` module.
public class DefinedCoreRouter: ObservableObject {
    @Published var pages: [DefinedCorePage] = []
    @Published var indicator: String? = nil
    
    public init() {
        // Do nothing.
    }
    
    func add(_ adding: DefinedCorePage) {
        for page in pages {
            if (page.equals(adding)) {
                return
            }
        }
        self.pages.append(adding)
    }
    
    func add(list adding: [DefinedCoreItem]) {
        for item in adding {
            var contained = false
            for page in pages {
                if (page.equals(item.linked)) {
                    contained = true
                    break
                }
            }
            if (!contained) {
                self.pages.append(item.linked)
            }
        }
    }
    
    func clear() {
        self.pages = []
    }
}
