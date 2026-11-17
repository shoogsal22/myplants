 import SwiftUI

/// واجهة "All Done!" (لما تنسقي كل النباتات)
struct AllDoneView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Image("plantMascot")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Text("All Done! 🎉").font(.title2.bold())
            Text("All Reminders Completed")
                .font(.callout)
                .foregroundStyle(.secondary)
            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .transition(.opacity)
    }
}

#Preview {
    AllDoneView().background(Color.appBackground)
}
