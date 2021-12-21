import Foundation

/// [GE] A selector for GeneralStatus (including some patterns)
///
/// You are now able to select `all` when choosing General Statuses you want.
/// And you do not have to put all statuses in an array anymore when using `GeneralStatusSelector`.
///
/// # To Developers:
///   For General Statuses, we have a another Enum holding them and basically when developing,
///   we create two methods for different type of input (`GeneralStatus` and `GeneralStatusSelector`).
///   So we do not have to handle General Statuses again when we have `GeneralStatusSelector` as parameter type.
public enum GeneralStatusSelector {
    ///
    case all
}

extension GeneralStatusSelector {
    /// [DE Internal]
    func getGS() -> [GeneralStatus] {
        switch self {
        case .all:
            return [.default, .loading, .active, .done, .error, .disabled];
        }
    }
}
