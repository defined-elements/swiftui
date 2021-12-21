import SwiftUI

/// [DE] A lazy holder for updating data asynchronously.
///
/// - TODO: Use a better way to update the lazy data.
/// - TODO: Documents.
public protocol LazyData : ObservableObject {
    ///
    associatedtype T
    
    ///
    var value: T { get set }
    
    ///
    var stringValue: String { get set }
    
    ///
    var status: GeneralStatus { get set }
    
    ///
    init(_ def: T, defStatus: GeneralStatus)
    
    /// [DE] Use this function to update the data later!
    func update(_ value: T, status: GeneralStatus) -> Void
}
