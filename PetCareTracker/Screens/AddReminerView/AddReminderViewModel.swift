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
}
