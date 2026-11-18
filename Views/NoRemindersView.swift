import SwiftUI

/// واجهة "No reminders set yet.." (لما تحذف كل النباتات)
struct NoRemindersView: View {
    var body: some View {
        Text("No reminders set yet..")
            .font(.callout.weight(.semibold))
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NoRemindersView().background(Color.appBackground)
}

