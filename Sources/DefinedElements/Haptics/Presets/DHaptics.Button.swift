extension DefinedHaptics {
    /// [DE]
    public class tap {
        ///
        public static func press() {
            DefinedHaptics.simple(intensity: 0.46, sharpness: 0.40)
        }
        
        ///
        public static func release() {
            DefinedHaptics.simple(intensity: 0.32, sharpness: 0.40)
        }
    }
}
