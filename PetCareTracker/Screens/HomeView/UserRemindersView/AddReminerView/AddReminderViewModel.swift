//
//  AddReminderViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 18/12/2024.
//

import SwiftUI

@Observable
final class AddReminderViewModel {
    let rows: [GridItem] = [GridItem(.flexible())]
    var selectedPet: Pet?
    var isChoosingReminder = false
    var selectedReminder: String?
    var selectedDate: Date = Date()
    var selectedTime: Date = Date()
    var description: String?
    
    var isValidForm: Bool {
        selectedPet != nil && selectedReminder != nil
    }
    
    init() {}
    
    init(from reminder: Reminder) {
        self.selectedPet = PetMockData.samplePets.first(where: { $0.name == reminder.pet })
        self.selectedReminder = reminder.type
        self.selectedDate = reminder.date
        self.selectedTime = reminder.time
        self.description = reminder.comment
    }
}
