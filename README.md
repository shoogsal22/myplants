Planto 🌱
-
Planto is an iOS app that helps you take care of your houseplants. Set a watering reminder for each plant, check them off as you water them, and get notified when it's time for a sip.

Main Features
-
Start screen: a friendly welcome that guides you to set your first plant reminder.
Add a plant reminder: choose the plant name, room, light level, watering frequency, and water amount.
Today's list: see all your plants with their room, light, and water details.
Daily progress: a progress bar and a message that update as you water your plants.
Mark as watered: tap the circle next to a plant when you've watered it.
Edit or delete: tap a plant to edit its reminder, delete it from the edit screen, or swipe it away.
All Done screen: a celebration when every plant has been watered.
Notifications: local reminders that say "Hey! let's water your plant".
Dark and light mode: the interface adapts to the device theme.

Screenshots
-

Technologies Used
-
Swift and SwiftUI for the interface
MVVM architecture (Models, ViewModels, Views, Repositories, Services)
Observation framework (@Observable) for state management
UserNotifications for local watering reminders
Icon Composer for the app icon
Xcode, targeting iOS 17+

Project Structure
-
myplants
├── PlantoApp.swift
├── Models/          Plant data
├── ViewModels/      PlantsViewModel, PlantFormViewModel
├── Views/           Start, plant list, All Done, Set Reminder
├── Components/      PlantRow, Chip, form components
├── Repositories/    Saving and loading plants
├── Services/        NotificationManager
└── Theme/           Colors

How to Run
-
Clone the repository.
Open myplants.xcodeproj in Xcode.
Select an iPhone simulator or a connected device.
Press Cmd + R.
Notes
-
In the current build, plants are kept in memory for the session, so the app starts from the Start screen each time it launches.

