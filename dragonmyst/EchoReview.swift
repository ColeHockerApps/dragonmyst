import Combine
import StoreKit
import SwiftUI

final class EchoReview: ObservableObject {
    private let triggerKey = "echo.review.counter"
    private let threshold  = 8

    func registerStep() {
        let current = UserDefaults.standard.integer(forKey: triggerKey)
        let updated = current + 1
        UserDefaults.standard.set(updated, forKey: triggerKey)

        if updated >= threshold {
            ask()
            UserDefaults.standard.set(0, forKey: triggerKey)
        }
    }

    private func ask() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
