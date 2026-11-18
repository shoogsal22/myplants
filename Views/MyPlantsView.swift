import SwiftUI

/// الشاشة الرئيسية: تعرض الواجهة حسب حالة الـ ViewModel
struct MyPlantsView: View {
    @Environment(PlantsViewModel.self) private var viewModel
    @State private var showForm = false
    @State private var editingPlant: Plant?

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Color.appBackground.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Text("My Plants 🌱")
                    .font(.largeTitle.bold())
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                Divider()

                switch viewModel.screenState {
                case .empty:
                    OnboardingView { showForm = true }
                case .noReminders:
                    NoRemindersView()
                case .inProgress:
                    PlantListView(editingPlant: $editingPlant)
                case .allDone:
                    AllDoneView()
                }
            }

            if viewModel.screenState != .empty {
                Button { showForm = true } label: {
                    Image(systemName: "plus")
                        .font(.title3.bold())
                        .foregroundStyle(.white)
                        .frame(width: 52, height: 52)
                        .background(Color.plantGreen, in: Circle())
                        .shadow(radius: 6)
                }
                .padding(24)
            }
        }
        .sheet(isPresented: $showForm) {
            PlantFormView(viewModel: PlantFormViewModel(
                plant: nil,
                onSave: viewModel.save
            ))
        }
        .sheet(item: $editingPlant) { plant in
            PlantFormView(viewModel: PlantFormViewModel(
                plant: plant,
                onSave: viewModel.save,
                onDelete: viewModel.delete
            ))
        }
    }
}

#Preview("Light") {
    MyPlantsView()
        .environment(PlantsViewModel(repository: InMemoryPlantRepository()))
        .preferredColorScheme(.light)
}

#Preview("Dark") {
    MyPlantsView()
        .environment(PlantsViewModel(repository: InMemoryPlantRepository()))
        .preferredColorScheme(.dark)
}
