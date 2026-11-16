import Foundation

/// طبقة الحفظ: الـ ViewModel يتعامل مع هذا الـ protocol بس، وما يدري وين تنحفظ البيانات
protocol PlantRepository {
    func load() -> [Plant]
    func save(_ plants: [Plant])
    func loadLastResetDate() -> Date?
    func saveLastResetDate(_ date: Date)
}

struct UserDefaultsPlantRepository: PlantRepository {
    private let plantsKey = "plants"
    private let resetKey = "lastResetDate"
    private let defaults = UserDefaults.standard

    func load() -> [Plant] {
        guard let data = defaults.data(forKey: plantsKey),
              let plants = try? JSONDecoder().decode([Plant].self, from: data)
        else { return [] }
        return plants
    }

    func save(_ plants: [Plant]) {
        guard let data = try? JSONEncoder().encode(plants) else { return }
        defaults.set(data, forKey: plantsKey)
    }

    func loadLastResetDate() -> Date? {
        defaults.object(forKey: resetKey) as? Date
    }

    func saveLastResetDate(_ date: Date) {
        defaults.set(date, forKey: resetKey)
    }
}

/// حفظ مؤقت في الذاكرة فقط: كل ما تشغّل التطبيق يبدأ من الصفر (واجهة Start)
final class InMemoryPlantRepository: PlantRepository {
    private var plants: [Plant] = []
    private var lastResetDate: Date?

    func load() -> [Plant] { plants }
    func save(_ plants: [Plant]) { self.plants = plants }
    func loadLastResetDate() -> Date? { lastResetDate }
    func saveLastResetDate(_ date: Date) { lastResetDate = date }
}
