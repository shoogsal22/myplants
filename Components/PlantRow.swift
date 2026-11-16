import SwiftUI

/// صف النبتة في القائمة (دائرة السقي + الاسم + الغرفة + الشارات)
struct PlantRow: View {
    let plant: Plant
    let onToggle: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Button(action: onToggle) {
                Image(systemName: plant.isWatered ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(plant.isWatered ? Color.plantMint : .secondary)
            }
            .buttonStyle(.plain)

            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 4) {
                    Image(systemName: "location")
                    Text("in \(plant.room.rawValue)")
                }
                .font(.footnote)
                .foregroundStyle(.secondary)

                Text(plant.name)
                    .font(.title2)
                    .foregroundStyle(plant.isWatered ? .secondary : .primary)

                HStack(spacing: 8) {
                    Chip(icon: "sun.max", text: plant.light.rawValue, tint: .plantSun)
                    Chip(icon: "drop", text: plant.water.rawValue, tint: .plantWater)
                }
            }
        }
        .padding(.vertical, 6)
    }
}
