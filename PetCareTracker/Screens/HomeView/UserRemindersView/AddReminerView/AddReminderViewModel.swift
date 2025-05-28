//
//  AddReminderViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 18/12/2024.
//

import SwiftUI
import SwiftData

// MARK: - AddReminderViewModel

@MainActor
@Observable
final class AddReminderViewModel: DataManagerInitializable {
    var mode: EditModeReminder = .add
    
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
    
    var pets: [Pet] = []
    
    internal var dataManager: SwiftDataManager? = nil
    
    func setup(context: ModelContext, mode: EditModeReminder) {
        self.mode = mode
        initializeDataManager(context: context)
        
        pets = dataManager?.fetchAllPets() ?? []
        
        switch mode {
        case .add:
            break
        case .edit(let reminder):
            selectedPet = pets.first(where: { $0.name == reminder.pet })
            selectedReminder = reminder.type
            selectedDate = reminder.date
            selectedTime = reminder.time
            description = reminder.comment ?? ""
        }
    }
    
    func saveData() {
        guard isValidForm,
              let pet = selectedPet,
              let type = selectedReminder else { return }
        
        switch mode {
        case .add:
            let newReminder = Reminder(
                pet: pet.name,
                type: ReminderType(rawValue: type) ?? .none,
                time: selectedTime,
                date: selectedDate,
                comment: description
            )
            dataManager?.addReminder(newReminder)
        case .edit(let reminder):
            reminder.pet = pet.name
            reminder.type = type
            reminder.time = selectedTime
            reminder.date = selectedDate
            reminder.comment = description
            dataManager?.updateReminder(reminder)
        }
    }
}
