import Combine
import SwiftUI

final class HapticsCrafter: ObservableObject {
    static let shared = HapticsCrafter()

    private let soft = UIImpactFeedbackGenerator(style: .soft)
    private let light = UIImpactFeedbackGenerator(style: .light)
    private let medium = UIImpactFeedbackGenerator(style: .medium)
    private let rigid = UIImpactFeedbackGenerator(style: .rigid)

    func tapSoft() {
        soft.impactOccurred()
    }

    func tapLight() {
        light.impactOccurred()
    }

    func tapMedium() {
        medium.impactOccurred()
    }

    func tapRigid() {
        rigid.impactOccurred()
    }

    func success() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    func warning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }

    func error() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
