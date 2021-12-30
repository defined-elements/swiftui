import SwiftUI

///
class DefinedSafeAreaTracker {
    ///
    var top: Bool = false
    
    ///
    var bottom: Bool = false
    
    ///
    func getSafeAreaSetup() -> DefinedSafeAreaConfiguration {
        if (top && bottom) {
            return .vertical
        }
        if (top) {
            return .top
        }
        if (bottom) {
            return .bottom
        }
        return .none
    }
    
    ///
    func setSafeAreaSetup(_ setup: DefinedSafeAreaConfiguration) {
        switch setup {
        case .vertical:
            self.top = true
            self.bottom = true
        case .top:
            self.top = true
            self.bottom = false
        case .bottom:
            self.top = false
            self.bottom = true
        default:
            self.top = false
            self.bottom = false
        }
    }
}
