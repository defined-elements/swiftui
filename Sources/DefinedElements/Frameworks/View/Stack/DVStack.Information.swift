import SwiftUI

class DefinedViewStackInformation {
    var width: CGFloat
    var height: CGFloat
    var safeAreaInsets: EdgeInsets
    
    init(
        width: CGFloat = UIScreen.main.bounds.size.width,
        height: CGFloat = UIScreen.main.bounds.size.height,
        safeAreaInsets: EdgeInsets = .init()
    ) {
        self.width = width
        self.height = height
        self.safeAreaInsets = safeAreaInsets
    }
}
