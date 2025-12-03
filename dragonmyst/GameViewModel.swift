import Combine
import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var fadeIn: Bool = false
    @Published var logoScale: CGFloat = 0.9
    @Published var playPulse: Bool = false
 
    func onAppear() {
        withAnimation(.easeOut(duration: 0.4)) {
            fadeIn = true
            logoScale = 1.0
        }

        withAnimation(
            .easeInOut(duration: 1.1)
                .repeatForever(autoreverses: true)
        ) {
            playPulse = true
        }
    }

    func openBoard(trail: TrailWeaver, echo: EchoReview) {
        HapticsCrafter.shared.tapMedium()
        echo.registerStep()
        trail.moveToBoard()
    }

    func openSettings(trail: TrailWeaver) {
        HapticsCrafter.shared.tapLight()
        trail.moveToSettings()
    }

    func openRules(trail: TrailWeaver) {
        HapticsCrafter.shared.tapLight()
        trail.moveToRules()
    }

    func openPrivacy(trail: TrailWeaver) {
        HapticsCrafter.shared.tapSoft()
        trail.moveToPrivacy()
    }
}
