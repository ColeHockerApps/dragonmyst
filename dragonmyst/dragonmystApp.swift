import Combine
import SwiftUI

@main
struct DragonStoneMystApp: App {
    @StateObject private var theme   = MystTheme()
    @StateObject private var paths   = RealmPaths()
    @StateObject private var trail   = TrailWeaver()
    @StateObject private var haptics = HapticsCrafter()
    @StateObject private var echo    = EchoReview()

    var body: some Scene {
        WindowGroup {
            RootStage()
                .environmentObject(theme)
                .environmentObject(paths)
                .environmentObject(trail)
                .environmentObject(haptics)
                .environmentObject(echo)
        }
    }
}

private struct RootStage: View {
    @EnvironmentObject private var theme: MystTheme
    @EnvironmentObject private var trail: TrailWeaver

    var body: some View {
        ZStack {
            theme.backgroundGradient
                .ignoresSafeArea()

            switch trail.currentScreen {
            case .game:
                GameScreen()
            case .board:
                BoardContainer()
            case .settings:
                SettingsScreen()
            case .rules:
                RulesScreen()
            case .privacy:
                PrivacyScreen()
            }
        }
        .animation(.easeInOut(duration: 0.25), value: trail.currentScreen)
    }
}
