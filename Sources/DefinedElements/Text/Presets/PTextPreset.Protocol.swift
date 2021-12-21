import SwiftUI

/// [DE] A protocol of custom TextPreset.
///
/// A protocol of custom text preset working for `DefinedText` or other `DefinedView` modules.
public protocol TextPresetProtocol {
    var font: DefinedFont { get }
    var size: CGFloat { get }
    var weight: Font.Weight { get }
    var specs: FontSpecs { get }
}
