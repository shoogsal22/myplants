import SwiftUI

/// واجهة Set Reminder (إضافة / تعديل / حذف التذكير)
struct PlantFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: PlantFormViewModel

    init(viewModel: PlantFormViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    HStack {
                        Text("Plant Name")
                            .font(.body)
                        TextField("Pothos", text: $viewModel.draft.name)
                            .tint(Color.plantMint)
                    }
                    .padding()
                    .background(Color.formCard, in: RoundedRectangle(cornerRadius: 12))

                    FormCard {
                        PickerRow(icon: "location", title: "Room", selection: $viewModel.draft.room)
                        Divider()
                        PickerRow(icon: "sun.max", title: "Light", selection: $viewModel.draft.light)
                    }

                    FormCard {
                        PickerRow(icon: "drop", title: "Watering Days", selection: $viewModel.draft.wateringDays)
                        Divider()
                        PickerRow(icon: "drop", title: "Water", selection: $viewModel.draft.water)
                    }

                    if viewModel.isEditing {
                        Button(role: .destructive) {
                            viewModel.delete()
                            dismiss()
                        } label: {
                            Text("Delete Reminder")
                                .font(.body)
                                .foregroundStyle(.red)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.formCard, in: RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
                .padding()
            }
            .background(Color.formBackground.ignoresSafeArea())
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { dismiss() } label: { Image(systemName: "xmark") }
                        .tint(.primary)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.save()
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark").foregroundStyle(Color.plantMint)
                    }
                    .disabled(!viewModel.canSave)
                }
            }
        }
        .presentationDetents([.large])
    }
}

#Preview("Light") {
    PlantFormView(viewModel: PlantFormViewModel(plant: nil, onSave: { _ in }))
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    PlantFormView(viewModel: PlantFormViewModel(plant: nil, onSave: { _ in }))
        .preferredColorScheme(.dark)
}
