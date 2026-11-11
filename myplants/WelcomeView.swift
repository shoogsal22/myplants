
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // Header
                HStack {
                    Text("My Plants 🌱")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)

                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 25)

                Divider()
                    .background(Color.gray.opacity(0.4))

                Spacer()

                // Plant Image
                Image("plant")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 220)

                // Welcome Title
                Text("Start your plant journey!")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 35)

                // Description
                Text("Now all your plants will be in one place and\nwe will help you take care of them :) 🪴")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 18)

                Spacer()

                // Button
                Button(action: {
                    print("Set Plant Reminder")
                }) {
                    Text("Set Plant Reminder")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(
                            Color(red: 0.16, green: 0.48, blue: 0.38)
                        )
                        .clipShape(Capsule())
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 45)
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WelcomeView()
}

