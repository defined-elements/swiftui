/// [DE] General status for entire `Defined Elements` framework.
///
/// - Note: `LazyData` system should also use this enumeration.
public enum GeneralStatus {
    /// [DE] Default (status)
    case `default`
    
    /// [DE] Loading (status)
    case loading
    
    /// [DE] Active (status)
    case active
    
    /// [DE] Done (status)
    case done
    
    /// [DE] Error (status)
    case error
    
    /// [DE] Disabled (status)
    case disabled
}
