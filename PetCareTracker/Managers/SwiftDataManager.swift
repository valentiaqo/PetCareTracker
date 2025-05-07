//
//  SwiftDataManager.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 03/05/2025.
//

import Foundation
import SwiftData


enum DataAction: String {
    case insertPet = "insert pet"
    case deletePet = "delete pet"
    case updatePet = "update pet"
    
    case insertReminder = "insert reminder"
    case deleteReminder = "delete reminder"
    case updateReminder = "update reminder"
}

@MainActor
struct SwiftDataManager {
    let context: ModelContext

    // MARK: - Pets
    func addPet(_ pet: Pet) {
        context.insert(pet)
        saveContext(for: .insertPet)
    }

    func deletePet(_ pet: Pet) {
        context.delete(pet)
        saveContext(for: .deletePet)
    }

    func updatePet(_ pet: Pet) {
        saveContext(for: .updatePet)
    }
    
    func fetchAllPets() -> [Pet] {
        let descriptor = FetchDescriptor<Pet>()
        
        do {
            return try context.fetch(descriptor)
        } catch {
            print("Failed to fetch pets: \(error)")
            return []
        }
    }

    // MARK: - Reminders
    func addReminder(_ reminder: Reminder) {
        context.insert(reminder)
        saveContext(for: .insertReminder)
    }

    func deleteReminder(_ reminder: Reminder) {
        context.delete(reminder)
        saveContext(for: .deleteReminder)
    }

    func updateReminder(_ reminder: Reminder) {
        saveContext(for: .updateReminder)
    }

    // MARK: - Helper
    private func saveContext(for action: DataAction) {
        do {
            try context.save()
        } catch {
            print("Failed to \(action.rawValue): \(error.localizedDescription)")
        }
    }
}
