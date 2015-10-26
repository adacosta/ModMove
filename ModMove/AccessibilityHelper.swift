import AppKit
import Foundation

struct AccessibilityHelper {
    static func askForAccessibilityIfNeeded() {
        let key: String = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String
        let options = [key: true]
        let enabled = AXIsProcessTrustedWithOptions(options)

        if enabled {
            return
        }

        let alert = NSAlert()
        alert.messageText = "Enable Accessibility First"
        alert.informativeText = "Find the popup right behind this one, click \"Open System Preferences\" and enable ModMove. Then launch ModMove again."
        alert.alertStyle = .WarningAlertStyle
        alert.addButtonWithTitle("Quit")
        alert.runModal()
        NSApp.terminate(nil)
    }
}
