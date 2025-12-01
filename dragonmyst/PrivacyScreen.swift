import Combine
import SwiftUI
import WebKit

struct PrivacyScreen: View {
    @EnvironmentObject private var theme: MystTheme
    @EnvironmentObject private var trail: TrailWeaver
    @EnvironmentObject private var paths: RealmPaths
    @StateObject private var vm = PrivacyViewModel()

    @State private var isLoaded: Bool = false

    var body: some View {
        ZStack {
            theme.backgroundGradient
                .ignoresSafeArea()

            AuraLayer()

            VStack(spacing: 24) {
                header
                    .padding(.top, 28)
                    .padding(.horizontal, 26)

                panel
                    .padding(.horizontal, 26)
                    .frame(maxWidth: 600, maxHeight: .infinity)

                Spacer()

                closeButton
                    .padding(.bottom, 28)
                    .padding(.horizontal, 26)
            }
            .opacity(vm.fadeIn ? 1 : 0)
            .animation(.easeOut(duration: 0.3), value: vm.fadeIn)

            if !isLoaded {
                loadingOverlay
            }
        }
        .onAppear {
            isLoaded = false
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

    private var panel: some View {
        ScrollPanel(link: paths.tomeScroll) {
            withAnimation(.easeOut(duration: 0.25)) {
                isLoaded = true
            }
        }
        .cornerRadius(16)
        .shadow(color: GemTokens.shadowSoft, radius: 10, x: 0, y: 4)
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

    private var loadingOverlay: some View {
        ZStack {
            Color.black.opacity(0.08)
                .ignoresSafeArea()

            VStack(spacing: 10) {
                ProgressView()
                    .scaleEffect(1.1)

                Text("Loading policy…")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(GemTokens.textMuted)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(GemTokens.stoneDark)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(GemTokens.borderSoft, lineWidth: 1)
                    )
                    .shadow(color: GemTokens.shadowSoft, radius: 10, x: 0, y: 6)
            )
        }
        .transition(.opacity)
    }
}

struct ScrollPanel: UIViewRepresentable {
    let link: URL
    let onFinish: () -> Void

    func makeCoordinator() -> Guide {
        Guide(onFinish: onFinish)
    }

    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView(frame: .zero)
        view.navigationDelegate = context.coordinator
        view.isOpaque = false
        view.backgroundColor = .clear
        view.scrollView.backgroundColor = .clear
        view.scrollView.alwaysBounceVertical = true

        let request = URLRequest(url: link)
        view.load(request)

        return view
    }

    func updateUIView(_ uiView: WKWebView, context: Context) { }

    final class Guide: NSObject, WKNavigationDelegate {
        private let onFinish: () -> Void

        init(onFinish: @escaping () -> Void) {
            self.onFinish = onFinish
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            onFinish()
        }

        func webView(_ webView: WKWebView,
                     didFail navigation: WKNavigation!,
                     withError error: Error) {
            onFinish()
        }

        func webView(_ webView: WKWebView,
                     didFailProvisionalNavigation navigation: WKNavigation!,
                     withError error: Error) {
            onFinish()
        }
    }
}
