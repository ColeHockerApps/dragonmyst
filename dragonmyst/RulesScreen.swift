import Combine
import SwiftUI

struct RulesScreen: View {
    @EnvironmentObject private var theme: MystTheme
    @EnvironmentObject private var trail: TrailWeaver
    @StateObject private var vm = RulesViewModel()

    var body: some View {
        ZStack {
            theme.backgroundGradient
                .ignoresSafeArea()

            AuraLayer()

            VStack(spacing: 24) {
                header
                    .padding(.top, 28)
                    .padding(.horizontal, 26)

                scrollContent
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
            Text(vm.title)
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(GemTokens.textMain)
                .shadow(color: GemTokens.glow.opacity(0.35), radius: 8, x: 0, y: 3)

            Spacer()
        }
    }

    private var scrollContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                ruleBlock(
                    title: "Goal",
                    text: "Clear the board by matching pairs of tiles with the same symbol."
                )

                ruleBlock(
                    title: "How to Match",
                    text: "Tap two tiles that are free and identical. When they match, they disappear from the board."
                )

                ruleBlock(
                    title: "Free Tiles",
                    text: "A tile is free if it is not covered by another tile and has at least one open side."
                )

                ruleBlock(
                    title: "No Timer",
                    text: "Play at your own pace. There is no countdown, so you can think and relax."
                )

                ruleBlock(
                    title: "Stuck?",
                    text: "If you run out of moves, simply restart the level and try a different path."
                )

                Text("Enjoy the puzzle, take your time, and let the board slowly fall into place.")
                    .font(.system(size: 14))
                    .foregroundColor(GemTokens.textMuted)
                    .padding(.top, 4)
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
            .padding(.bottom, 4)
        }
    }

    private func ruleBlock(title: String, text: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(GemTokens.textMain)

            Text(text)
                .font(.system(size: 14))
                .foregroundColor(GemTokens.textMuted)
        }
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
