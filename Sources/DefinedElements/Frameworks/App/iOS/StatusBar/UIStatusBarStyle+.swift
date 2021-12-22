import SwiftUI

public extension UIStatusBarStyle {
    func reverse() -> UIStatusBarStyle {
        return self == .darkContent ? .lightContent : .darkContent
    }
}
