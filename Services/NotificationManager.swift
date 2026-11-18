import Foundation
import UserNotifications

enum NotificationManager {
    static func requestPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) { _, _ in }
    }

    static func schedule(for plant: Plant) {
        cancel(for: plant)

        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your plant"
        content.sound = .default

        #if DEBUG
        // للتجربة: يوصل بعد 5 ثواني مرة وحدة
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        #else
        let seconds = TimeInterval(plant.wateringDays.days * 24 * 60 * 60)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: true)
        #endif

        let request = UNNotificationRequest(identifier: plant.id.uuidString,
                                            content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }

    static func cancel(for plant: Plant) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [plant.id.uuidString])
    }
}
