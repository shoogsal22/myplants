import SwiftUI

@main
struct PlantoApp: App {
    // InMemory = كل تشغيل يبدأ من واجهة Start.
    // لو تبغى النباتات تنحفظ بين التشغيلات بدّلها بـ UserDefaultsPlantRepository()
    @State private var viewModel = PlantsViewModel(repository: InMemoryPlantRepository())
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            MyPlantsView()
                .environment(viewModel)
                .preferredColorScheme(.dark)
                .onAppear { NotificationManager.requestPermission() }
                .onChange(of: scenePhase) { _, phase in
                    if phase == .active { viewModel.resetIfNewDay() }
                }
        }
    }
}
