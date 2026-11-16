import SwiftUI

/// واجهة "Start your plant journey!" (لما ما يكون فيه نباتات)
struct OnboardingView: View {
    var onStart: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Image("plantMascot")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text("Start your plant journey!")
                .font(.title2.bold())
            Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                .font(.callout)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            Spacer()
            Button(action: onStart) {
                Text("Set Plant Reminder")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.plantGreen, in: Capsule())
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 48)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OnboardingView {}.background(Color.appBackground)
}
