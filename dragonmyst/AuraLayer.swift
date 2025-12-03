import Combine
import SwiftUI

struct AuraLayer: View {
    @State private var shimmerA: CGFloat = 0.0
    @State private var shimmerB: CGFloat = 0.0
 
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            GemTokens.glow.opacity(0.16),
                            .clear
                        ],
                        center: .center,
                        startRadius: 20,
                        endRadius: 160
                    )
                )
                .scaleEffect(1 + shimmerA * 0.12)
                .blur(radius: 16)
                .animation(.easeInOut(duration: 2.6).repeatForever(), value: shimmerA)

            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            GemTokens.accent.opacity(0.13),
                            .clear
                        ],
                        center: .center,
                        startRadius: 40,
                        endRadius: 200
                    )
                )
                .scaleEffect(1 + shimmerB * 0.18)
                .blur(radius: 20)
                .animation(.easeInOut(duration: 3.4).repeatForever(), value: shimmerB)
        }
        .onAppear {
            shimmerA = 1.0
            shimmerB = 1.0
        }
    }
}
