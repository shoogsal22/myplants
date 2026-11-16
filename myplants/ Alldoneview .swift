import SwiftUI

/// واجهة "All Done!" (لما تنسقي كل النباتات)
struct AllDoneView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Text("🪴").font(.system(size: 110))
            Text("All Done! 🎉").font(.title3.bold())
            Text("All Reminders Completed")
                .font(.footnote)
                .foregroundStyle(.secondary)
            Spacer()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .transition(.opacity)
    }
}

#Preview {
    AllDoneView().background(.black)
}
