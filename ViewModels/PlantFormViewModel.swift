import SwiftUI
import Observation

/// ViewModel لشاشة Set Reminder (إضافة / تعديل / حذف)
@Observable
final class PlantFormViewModel {
    var draft: Plant
    let isEditing: Bool

    @ObservationIgnored private let onSave: (Plant) -> Void
    @ObservationIgnored private let onDelete: ((Plant) -> Void)?

    init(plant: Plant?,
         onSave: @escaping (Plant) -> Void,
         onDelete: ((Plant) -> Void)? = nil) {
        self.draft = plant ?? Plant(name: "")
        self.isEditing = plant != nil
        self.onSave = onSave
        self.onDelete = onDelete
    }

    var canSave: Bool {
        !draft.name.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func save() {
        draft.name = draft.name.trimmingCharacters(in: .whitespaces)
        onSave(draft)
    }

    func delete() {
        onDelete?(draft)
    }
}
