import Foundation

/// [DE] A general warning module for some less potential warning units.
///
///   - Important: If a unit may generate some warnings inside itself, whatever the cause is,
///   you should use `DefinedPotentialWarning` protocol instead of this.
///
///   It can be much easier and safer (we might make some smart warning handlers in the future).
public struct DefinedWarning : DefinedPotentialWarning {
    public var name: String
    
    /// [DE] Create a general warning sender on console.
    ///
    /// - Parameters:
    ///   - from: The name of the module that generates this warning. (optional)
    private init(from: String? = nil) {
        self.name = from ?? "<Global>"
    }
    
    /// [DE] Send a general warning on console.
    ///
    /// - Parameters:
    ///   - from: The name of the module that generates this warning. (optional)
    ///   - message: The message of the warning. (required)
    public static func send(from: String? = nil, _ message: String) {
        DefinedWarning(from: from).warning(message)
    }
}
