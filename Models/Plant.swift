import Foundation

enum Room: String, CaseIterable, Codable {
    case bedroom = "Bedroom", livingRoom = "Living Room", kitchen = "Kitchen"
    case balcony = "Balcony", bathroom = "Bathroom"
}

enum Light: String, CaseIterable, Codable {
    case fullSun = "Full sun", partialSun = "Partial sun", lowLight = "Low light"
}

enum WateringDays: String, CaseIterable, Codable {
    case everyDay = "Every day", every2 = "Every 2 days", every3 = "Every 3 days"
    case weekly = "Once a week", every10 = "Every 10 days", every14 = "Every 2 weeks"

    var days: Int {
        switch self {
        case .everyDay: 1
        case .every2: 2
        case .every3: 3
        case .weekly: 7
        case .every10: 10
        case .every14: 14
        }
    }
}

enum WaterAmount: String, CaseIterable, Codable {
    case small = "20-50 ml", medium = "50-100 ml", large = "100-200 ml", xlarge = "200-300 ml"
}

struct Plant: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var room: Room = .bedroom
    var light: Light = .fullSun
    var wateringDays: WateringDays = .everyDay
    var water: WaterAmount = .small
    var isWatered = false
}
