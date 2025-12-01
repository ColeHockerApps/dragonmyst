import Combine
import SwiftUI

final class TrailWeaver: ObservableObject {
    @Published var currentScreen: MystScreen = .game

    func moveToGame() {
        withAnimation(.easeInOut(duration: 0.25)) {
            currentScreen = .game
        }
    }

    func moveToBoard() {
        withAnimation(.easeInOut(duration: 0.25)) {
            currentScreen = .board
        }
    }

    func moveToSettings() {
        withAnimation(.easeInOut(duration: 0.25)) {
            currentScreen = .settings
        }
    }

    func moveToRules() {
        withAnimation(.easeInOut(duration: 0.25)) {
            currentScreen = .rules
        }
    }

    func moveToPrivacy() {
        withAnimation(.easeInOut(duration: 0.25)) {
            currentScreen = .privacy
        }
    }

    func closeCurrent() {
        withAnimation(.easeInOut(duration: 0.25)) {
            currentScreen = .game
        }
    }
}
