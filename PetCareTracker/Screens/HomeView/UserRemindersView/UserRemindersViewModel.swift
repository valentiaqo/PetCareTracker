//
//  UserRemindersViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 11/05/2025.
//

import Foundation
import SwiftData

@MainActor
@Observable
final class UserRemindersViewModel: DataManagerInitializable {
    var isAddingReminder = false
    var reminders: [Reminder] = []
    var selectedReminder: Reminder?
    var selectedDate: Date = .now
    
    var filteredReminders: [Reminder] {
        reminders
            .filter { Date.isSameDay($0.date, selectedDate) }
            .sorted { $0.time < $1.time }
    }
    
    internal var dataManager: SwiftDataManager? = nil
    
    private func fetchReminders() {
        reminders = dataManager?.fetchAllReminders() ?? []
    }
    
    func setup(context: ModelContext) {
        initializeDataManager(context: context)
        fetchReminders()
    }
    
    func refreshRemindersIfNeeded() {
        if !isAddingReminder {
            fetchReminders()
        }
    }
}
