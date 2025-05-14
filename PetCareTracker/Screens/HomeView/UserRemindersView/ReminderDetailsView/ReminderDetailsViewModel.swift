//
//  ReminderDetailsViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 24/01/2025.
//

import Foundation
import SwiftData

@MainActor
@Observable
final class ReminderDetailsViewModel: DataManagerInitializable {
    var isEditing = false
    
    internal var dataManager: SwiftDataManager? = nil
    
    func onComplete(_ reminder: Reminder) {
        dataManager?.deleteReminder(reminder)
    }
    
    func onEdit() {
        isEditing.toggle()
    }
    
    func onDelete(_ reminder: Reminder) {
        dataManager?.deleteReminder(reminder)
    }
    
    func setup(context: ModelContext) {
        initializeDataManager(context: context)
    }
}
