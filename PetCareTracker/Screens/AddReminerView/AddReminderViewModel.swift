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
    var description: String?
}
