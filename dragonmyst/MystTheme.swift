import Combine
import SwiftUI

final class MystTheme: ObservableObject {
    @Published var backgroundGradient: LinearGradient

    init() {
        backgroundGradient = LinearGradient(
            colors: [
                Color(red: 22/255, green: 28/255, blue: 48/255),
                Color(red: 14/255, green: 17/255, blue: 32/255)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    func highlightGlow() -> Color {
        Color(red: 120/255, green: 180/255, blue: 255/255, opacity: 0.45)
    }

    func depthShadow() -> Color {
        Color.black.opacity(0.28)
    }
}

