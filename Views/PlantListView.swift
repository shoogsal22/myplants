import SwiftUI

/// واجهة قائمة اليوم + شريط التقدم + الحذف بالسحب
struct PlantListView: View {
    @Environment(PlantsViewModel.self) private var viewModel
    @Binding var editingPlant: Plant?

    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 8) {
                Text(viewModel.headerText).font(.callout)
                ProgressView(value: viewModel.progress)
                    .tint(Color.plantMint)
                    .animation(.easeInOut, value: viewModel.progress)
            }
            .padding(.horizontal)
            .padding(.top, 16)

            List {
                ForEach(viewModel.plants) { plant in
                    PlantRow(plant: plant) {
                        viewModel.toggleWatered(plant)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture { editingPlant = plant }
                    .listRowBackground(Color.appBackground)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            withAnimation { viewModel.delete(plant) }
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
    }
}
