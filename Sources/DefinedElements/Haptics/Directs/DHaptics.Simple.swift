import Foundation
import CoreHaptics

/// [DE] Basic haptics extension for DefinedHaptics
extension DefinedHaptics {
    /// [DE] Trigger a simple haptic.
    ///
    /// The base function that can trigger a simple haptic with given intensity and sharpness.
    ///
    /// - Note: If you are looking for a click haptic or something, check `DefinedHaptics.tap`. We have `DefinedHaptics.tap.press()` and `DefinedHaptics.tap.release()` that are built just for you.
    ///
    /// - TODO: Engine is lost after switching the app.
    public static func simple(
        intensity: Float,
        sharpness: Float
    ) {
        if self.engine == nil {
            self.prepare()
        }
        
        // If the device does not support Haptic anyway, then we have nothing to do.
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // Intensity: how clear the feeling is. (big haptic, small haptic)
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: intensity)
        
        // Sharpness: how strong the feeling is. (tough, soft)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
        
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)

        do {
            // Play!
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try self.engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0.2)
        } catch {
            print("Failed to play the haptic: \(error.localizedDescription).")
        }
    }
}
