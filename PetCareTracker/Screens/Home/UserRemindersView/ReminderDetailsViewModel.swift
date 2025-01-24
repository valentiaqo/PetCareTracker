//
//  ReminderDetailsViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 24/01/2025.
//

import Foundation

@Observable
final class ReminderDetailsViewModel {
    var isEditing = false
    
    func onComplete() {
        print("Reminder completed")
    }
    
    func onEdit() {
        isEditing.toggle()
        print("Edit action triggered")
    }
    
    func onDelete() {
        print("Delete action triggered")
    }
}
