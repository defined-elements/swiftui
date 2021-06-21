import Foundation
import SwiftUI

/// [DE] A protocol for all units or modules that may generate a warning for developers when something goes wrong.
public protocol DefinedPotentialWarning {
    /// The name of the module or unit.
    ///
    /// For identifier purpose when generating the warning.
    ///
    /// - Important: It is required because the developer get a warning needs to know which unit goes wrong.
    var name: String { get }
    
    ///
    func warning(_ message: String) -> Void
}

public extension DefinedPotentialWarning {
    func warning(_ message: String? = nil) {
        print("-- [DefinedWarning] \(name)\n-- WARNING: \(message == nil ? "An intentional warning but no description provided." : message)")
    }
}
