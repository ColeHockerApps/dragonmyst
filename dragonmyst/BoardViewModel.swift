import Combine
import SwiftUI

final class BoardViewModel: ObservableObject {
    @Published var isReady: Bool = false
    @Published var fadeIn: Bool = false
    @Published var dimLayer: Double = 0.0

    func onAppear() {
        withAnimation(.easeOut(duration: 0.35)) {
            fadeIn = true
            dimLayer = 0.35  
        }
    }

    func markReady() {
        withAnimation(.easeOut(duration: 0.25)) {
            isReady = true
            dimLayer = 0.0
        }
    }

    func close(trail: TrailWeaver) {
        HapticsCrafter.shared.tapSoft()
        trail.closeCurrent()
    }
}
