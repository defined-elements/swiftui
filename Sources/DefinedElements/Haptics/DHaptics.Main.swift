import CoreHaptics
import SwiftUI

/// [DE] This is a Haptic Base Module for using `CoreHaptics` in a more elegant and modularized way.
///
/// - Note: Don't forget the `s` in the name. If you are curious --- `DefinedHaptic` is different from this. That should be an object for a single Haptic event, and this is only a base module. And actually, that one is designed to be called `DefinedHapticBuilder` to avoid the opaque naming.
public class DefinedHaptics {
    ///
    static var engine: CHHapticEngine? = nil

    /// [DE] Make the preparation for Haptic Engine < Not recommended >
    ///
    /// This function will be called automatically when you are triggering a Haptic and the engine is not ready.
    ///
    /// - Note: It should be an internal function. Call it only when needed to avoid exceeded usage of engine start procedure.
    internal static func prepare() {
        // If the device does not support Haptic anyway, then we have nothing to do.
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        do {
            self.engine = try CHHapticEngine()
            
            // Start the engine.
            try engine?.start()
            
            // When engine stopped: Reset the engine variable so that it can be reprepare again in the future. Otherwise, it is going to be failed after the scene goes inactive.
            engine?.stoppedHandler = { reason in
                // No need to show the reason for now.
                self.engine = nil
            }
        } catch {
            print("There was an error preparing the engine: \(error.localizedDescription)")
        }
    }
}
