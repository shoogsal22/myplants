import SwiftUI
import UIKit

// MARK: - ألوان تتبدل تلقائيًا بين Light و Dark

extension Color {
    /// لون له نسخة للفاتح ونسخة للغامق
    init(light: Color, dark: Color) {
        self.init(uiColor: UIColor { traits in
            traits.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
    }

    // الخلفيات (أسود في الغامق، أبيض في الفاتح)
    static let appBackground = Color(.systemBackground)

    // خلفية شاشة الفورم وبطاقاتها
    static let formBackground = Color(.systemGroupedBackground)
    static let formCard = Color(.secondarySystemGroupedBackground)

    // خلفية الشارات (Chip)
    static let cardGray = Color(.secondarySystemBackground)

    // ألوان التطبيق
    static let plantGreen = Color(red: 0.24, green: 0.47, blue: 0.38)
    static let plantMint = Color(
        light: Color(red: 0.16, green: 0.60, blue: 0.42),
        dark: Color(red: 0.45, green: 0.85, blue: 0.65)
    )

    // ألوان الشارات
    static let plantSun = Color(
        light: Color(red: 0.80, green: 0.55, blue: 0.00),
        dark: .yellow
    )
    static let plantWater = Color(
        light: Color(red: 0.00, green: 0.50, blue: 0.72),
        dark: .cyan
    )
}
