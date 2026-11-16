import SwiftUI
import Observation

/// ViewModel للشاشة الرئيسية: كل المنطق هنا، والـ Views بس تعرض
@Observable
final class PlantsViewModel {

    enum ScreenState {
        case empty        // Start your plant journey!
        case inProgress   // قائمة اليوم
        case allDone      // All Done!
    }

    private(set) var plants: [Plant] = []

    @ObservationIgnored private let repository: PlantRepository

    init(repository: PlantRepository = UserDefaultsPlantRepository()) {
        self.repository = repository
        self.plants = repository.load()
        resetIfNewDay()
    }

    // MARK: - State للعرض

    var screenState: ScreenState {
        if plants.isEmpty { return .empty }
        return wateredCount == plants.count ? .allDone : .inProgress
    }

    var wateredCount: Int { plants.filter(\.isWatered).count }

    var progress: Double {
        plants.isEmpty ? 0 : Double(wateredCount) / Double(plants.count)
    }

    var headerText: String {
        wateredCount == 0
            ? "Your plants are waiting for a sip 💦"
            : "\(wateredCount) of your plants feel loved today ✨"
    }

    // MARK: - Actions

    /// إضافة نبتة جديدة أو تحديث موجودة
    func save(_ plant: Plant) {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            plants[index] = plant
        } else {
            plants.append(plant)
        }
        persist()
        NotificationManager.schedule(for: plant)
    }

    func delete(_ plant: Plant) {
        plants.removeAll { $0.id == plant.id }
        persist()
        NotificationManager.cancel(for: plant)
    }

    func toggleWatered(_ plant: Plant) {
        guard let index = plants.firstIndex(where: { $0.id == plant.id }) else { return }
        withAnimation { plants[index].isWatered.toggle() }
        persist()
    }

    /// يرجّع كل النباتات "ما انسقت" إذا بدأ يوم جديد
    func resetIfNewDay(now: Date = .now) {
        if let last = repository.loadLastResetDate(),
           Calendar.current.isDate(last, inSameDayAs: now) { return }

        for index in plants.indices { plants[index].isWatered = false }
        repository.saveLastResetDate(now)
        persist()
    }

    private func persist() {
        repository.save(plants)
    }
}
