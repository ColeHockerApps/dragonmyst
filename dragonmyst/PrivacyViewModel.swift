import Combine
import SwiftUI

final class PrivacyViewModel: ObservableObject {
    @Published var fadeIn: Bool = false

    var title: String {
        "Privacy Policy"
    }

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
