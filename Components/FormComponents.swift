import SwiftUI

/// بطاقة تجمع صفوف الفورم (تتبدل مع الثيم)
struct FormCard<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 12) { content }
            .padding()
            .background(Color.formCard, in: RoundedRectangle(cornerRadius: 12))
    }
}

/// صف اختيار (Room / Light / Watering Days / Water)
struct PickerRow<T: CaseIterable & Hashable & RawRepresentable>: View
where T.RawValue == String, T.AllCases: RandomAccessCollection {
    let icon: String
    let title: String
    @Binding var selection: T

    var body: some View {
        HStack {
            Label(title, systemImage: icon)
                .font(.body)
            Spacer()
            Picker(title, selection: $selection) {
                ForEach(T.allCases, id: \.self) { Text($0.rawValue).tag($0) }
            }
            .pickerStyle(.menu)
            .tint(.secondary)
        }
    }
}
