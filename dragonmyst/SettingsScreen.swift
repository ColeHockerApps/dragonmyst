import Combine
import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject private var theme: MystTheme
    @EnvironmentObject private var trail: TrailWeaver
    @StateObject private var vm = SettingsViewModel()

    @State private var soundOn: Bool = true
    @State private var hapticsOn: Bool = true

    var body: some View {
        ZStack {
            theme.backgroundGradient
                .ignoresSafeArea()

            AuraLayer()

            VStack(spacing: 24) {
                header
                    .padding(.top, 28)
                    .padding(.horizontal, 26)

                settingsCard
                    .padding(.horizontal, 26)

                Spacer()

                closeButton
                    .padding(.bottom, 28)
                    .padding(.horizontal, 26)
            }
            .opacity(vm.fadeIn ? 1 : 0)
            .animation(.easeOut(duration: 0.3), value: vm.fadeIn)
        }
        .onAppear {
            vm.onAppear()
        }
    }

    private var header: some View {
        HStack {
            Text("Settings")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(GemTokens.textMain)
                .shadow(color: GemTokens.glow.opacity(0.35), radius: 8, x: 0, y: 3)

            Spacer()
        }
    }

    private var settingsCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            Toggle(isOn: $soundOn) {
                Text("Sound")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(GemTokens.textMain)
            }
            .tint(GemTokens.accent)

            Toggle(isOn: $hapticsOn) {
                Text("Haptics")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(GemTokens.textMain)
            }
            .tint(GemTokens.accent)

            Divider()
                .background(GemTokens.borderSoft)

            Text("Game settings are kept simple and follow your device preferences. You can mute your device at any time if you want a fully silent experience.")
                .font(.system(size: 14))
                .foregroundColor(GemTokens.textMuted)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(GemTokens.stoneDark)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(GemTokens.borderSoft, lineWidth: 1)
                )
                .shadow(color: GemTokens.shadowSoft, radius: 12, x: 0, y: 6)
        )
    }

    private var closeButton: some View {
        Button {
            vm.close(trail: trail)
        } label: {
            HStack(spacing: 10) {
                Image(systemName: MystGlyphs.back)
                    .font(.system(size: 16, weight: .semibold))

                Text("Back")
                    .font(.system(size: 17, weight: .semibold))
            }
            .foregroundColor(GemTokens.textMain)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(GemTokens.surfaceDim)
                    .shadow(color: GemTokens.shadowSoft, radius: 8, x: 0, y: 3)
            )
        }
    }
}
