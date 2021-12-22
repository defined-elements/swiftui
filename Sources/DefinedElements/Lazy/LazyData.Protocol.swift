import SwiftUI

/// [DE] A lazy holder for updating data asynchronously.
///
/// - TODO: Use a better way to update the lazy data.
/// - TODO: Documents.
public protocol LazyData : ObservableObject {
    /// [DE] The lazy type.
    associatedtype T
    
    /// [DE] The value behind this lazy data holder.
    var value: T { get set }
    
    /// [DE] The string value behind this lazy data holder.
    var stringValue: String { get set }
    
    /// [DE] The general status of this lazy data holder.
    var status: GeneralStatus { get set }
    
    init(_ def: T, defStatus: GeneralStatus)
    
    /// [DE] Use this function to update the lazy value!
    ///
    /// In default, the status will be set to `.done` after calling this function.
    /// If you want to customize the status, use `update(_:status:)`.
    ///
    /// - Parameter value: The new lazy value.
    func update(_ value: T) -> Void
    
    /// [DE] Use this function to update the status!
    ///
    /// Update the status only.
    ///
    /// - Parameter status: The new status for this lazy data.
    func update(status: GeneralStatus) -> Void
    
    /// [DE] Use this function to update the lazy value and status later!
    ///
    /// Update the lazy value and the status at the same time.
    ///
    /// - Parameter value: The new lazy value.
    /// - Parameter status: The new status for this lazy data.
    func update(_ value: T, status: GeneralStatus) -> Void
}
