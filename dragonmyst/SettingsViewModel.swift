import Combine
import SwiftUI

final class SettingsViewModel: ObservableObject {
    @Published var fadeIn: Bool = false

    func onAppear() {
        withAnimation(.easeOut(duration: 0.3)) {
            fadeIn = true
        }
    }

    func close(trail: TrailWeaver) {
        HapticsCrafter.shared.tapSoft()
        trail.closeCurrent()
    }
}
