import Combine
import SwiftUI

struct GameScreen: View {
    @EnvironmentObject private var theme: MystTheme
    @EnvironmentObject private var trail: TrailWeaver
    @EnvironmentObject private var echo: EchoReview
    @StateObject private var vm = GameViewModel()

    private var mainBackground: LinearGradient {
        LinearGradient(
            colors: [
                Color(red: 0.95, green: 0.38, blue: 0.18), // верх – ярко-оранжево-красный
                Color(red: 0.78, green: 0.14, blue: 0.14)  // низ – насыщенный красный
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    var body: some View {
        ZStack {
            mainBackground
                .ignoresSafeArea()

            AuraLayer()

            VStack(spacing: 32) {
                Spacer()

                logo

                playButton

                Spacer()

                buttonsRow
                    .padding(.bottom, 32)
            }
            .opacity(vm.fadeIn ? 1 : 0)
            .animation(.easeOut(duration: 0.3), value: vm.fadeIn)
        }
        .onAppear {
            vm.onAppear()
        }
    }

    private var logo: some View {
        VStack(spacing: 12) {

            // -------------------------------
            // Game Title Above the Logo
            // -------------------------------
            Text("FoJong Tiles:Revenge")
                .font(.system(size: 32, weight: .heavy))
                .foregroundColor(GemTokens.textMain)
                .shadow(color: GemTokens.glow.opacity(0.55), radius: 12, x: 0, y: 4)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .frame(maxWidth: 280)   
                .padding(.bottom, 4)

            // -------------------------------
            // Logo Image
            // -------------------------------
            Image("logo1")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 280)
                .scaleEffect(vm.logoScale)
                .shadow(color: Color.black.opacity(0.35), radius: 14, x: 0, y: 6)
        }
    }

    private var playButton: some View {
        Button {
            vm.openBoard(trail: trail, echo: echo)
        } label: {
            Text("Play")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(GemTokens.textMain)
                .padding(.horizontal, 42)
                .padding(.vertical, 14)
                .background(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(red: 1.0, green: 0.84, blue: 0.45),
                                    Color(red: 0.99, green: 0.67, blue: 0.23)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(
                            color: Color(red: 0.99, green: 0.67, blue: 0.23).opacity(0.55),
                            radius: vm.playPulse ? 20 : 10,
                            x: 0,
                            y: vm.playPulse ? 12 : 5
                        )
                )
        }
    }

    private var buttonsRow: some View {
        HStack(spacing: 28) {
            Button {
                vm.openSettings(trail: trail)
            } label: {
                iconBox(symbol: MystGlyphs.gear, label: "Settings")
            }

            Button {
                vm.openRules(trail: trail)
            } label: {
                iconBox(symbol: MystGlyphs.scroll, label: "Rules")
            }

            Button {
                vm.openPrivacy(trail: trail)
            } label: {
                iconBox(symbol: MystGlyphs.shield, label: "Privacy")
            }
        }
    }

    private func iconBox(symbol: String, label: String) -> some View {
        VStack(spacing: 6) {
            Image(systemName: symbol)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(GemTokens.textMain)

            Text(label)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(GemTokens.textMuted)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(GemTokens.surfaceDim)
                .shadow(color: GemTokens.shadowSoft, radius: 6, x: 0, y: 3)
        )
    }
}
