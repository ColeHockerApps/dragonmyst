import Combine
import SwiftUI

struct GemPrimaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(GemTokens.textMain)
                .padding(.horizontal, 24)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [
                                    GemTokens.accent.opacity(0.95),
                                    GemTokens.glow.opacity(0.75)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .shadow(color: GemTokens.accent.opacity(0.35), radius: 10, x: 0, y: 5)
                )
        }
        .buttonStyle(.plain)
    }
}

struct GemSecondaryButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(GemTokens.textMain)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(GemTokens.surfaceDim)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .stroke(GemTokens.borderSoft, lineWidth: 1)
                        )
                        .shadow(color: GemTokens.shadowSoft, radius: 8, x: 0, y: 4)
                )
        }
        .buttonStyle(.plain)
    }
}

struct GemIconButton: View {
    let symbol: String
    let label: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
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
        .buttonStyle(.plain)
    }
}

struct GemCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
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
}

extension View {
    func mystSectionTitle() -> some View {
        self
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(GemTokens.textMain)
    }

    func mystBodyText() -> some View {
        self
            .font(.system(size: 14))
            .foregroundColor(GemTokens.textMuted)
    }
}
