import Foundation

/// [DE] A protocol for all units or modules that may generate a warning for developers when something goes wrong.
public protocol DefinedPotentialWarning {
    /// The name of the module or unit.
    ///
    /// For identifier purpose when generating the warning.
    ///
    /// - Important: It is required because the developer get a warning needs to know which unit goes wrong.
    var name: String { get }
    
    /// [DE] Generate a warning.
    ///
    /// - Parameter message: The message of the warning. (required)
    func warning(_ message: String) -> Void
}

public extension DefinedPotentialWarning {
    /// [DE] Generate a warning by `DefinedPotentialWarning`.
    ///
    /// - Parameter message: The message of the warning. (required)
    func warning(_ message: String) {
        print(">> [DefinedWarning] \(name)\n>> - WARNING: \(message)")
    }
}
