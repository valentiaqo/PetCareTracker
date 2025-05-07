//
//  PetCareTrackerApp.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 06/10/2024.
//

import SwiftUI
import SwiftData

@main
struct PetCareTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: [Pet.self, Reminder.self])
    }
}
