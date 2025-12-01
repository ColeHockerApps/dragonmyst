import Combine
import SwiftUI

enum MystScreen: Equatable {
    case game
    case board
    case settings
    case rules
    case privacy
}

struct RuneButtonStyle {
    let gradient: LinearGradient
    let corner: CGFloat
    let shadow: CGFloat
}

struct LightShard: Identifiable {
    let id = UUID()
    let point: CGPoint
    let radius: CGFloat
    let opacity: Double
}

final class MystState: ObservableObject {
    @Published var sessionSteps: Int = 0
    @Published var lastMove: Date = Date()
}
