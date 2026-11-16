import SwiftUI

/// شارة صغيرة (الإضاءة / كمية الماء)
struct Chip: View {
    let icon: String
    let text: String
    let tint: Color

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.footnote)
        .foregroundStyle(tint)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.cardGray, in: Capsule())
    }
}
