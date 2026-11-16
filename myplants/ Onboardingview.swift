import SwiftUI

/// واجهة "Start your plant journey!" (لما ما يكون فيه نباتات)
struct OnboardingView: View {
    var onStart: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            // استبدله بصورة النبتة من الـ Assets: Image("plantMascot")
            Text("🪴").font(.system(size: 120))
            Text("Start your plant journey!")
                .font(.title3.bold())
            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            Button(action: onStart) {
                Text("Set Plant Reminder")
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: 220)
                    .padding(.vertical, 12)
                    .background(Color.plantGreen, in: Capsule())
            }
            .padding(.top, 8)
            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OnboardingView {}.background(.black)
}
