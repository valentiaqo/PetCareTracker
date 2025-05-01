//
//  Activity.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 31/10/2024.
//

import Foundation
import SwiftData

enum ReminderType: String, CaseIterable {
    case activity, cleaning, medication, grooming, feeding, playtime, training, vet, walking, other
    case none
}

class Reminder: Identifiable, Equatable, Hashable {
    var id: UUID
    var pet: String
    var type: String
    var time: Date
    var date: Date
    var comment: String?

    var reminderType: ReminderType {
        get { ReminderType(rawValue: type) ?? .none }
        set { type = newValue.rawValue }
    }

    init(id: UUID = UUID(), pet: String, type: ReminderType, time: Date = Date(), date: Date = Date(), comment: String? = nil) {
        self.id = id
        self.pet = pet
        self.type = type.rawValue
        self.time = time
        self.date = date
        self.comment = comment
    }

    static func == (lhs: Reminder, rhs: Reminder) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct ReminderMockData {
    static let sampleReminder = Reminder(pet: "Luna", type: .cleaning, comment: "Description")

    static let sampleReminders = [
        Reminder(pet: "Daisy", type: .activity, comment: "Play fetch"),
        Reminder(pet: "Luna", type: .cleaning, comment: "Description"),
        Reminder(pet: "Marco", type: .feeding, comment: "1234567890123456"),
        Reminder(pet: "Gupulabupulabupu", type: .grooming, comment: ""),
        Reminder(pet: "Eren", type: .medication),
        Reminder(pet: "Mr.Denmark", type: .other, comment: "Just long description"),
        Reminder(pet: "Gupgup", type: .playtime),
        Reminder(pet: "Gupulabupulabupu", type: .training, comment: "Very long description"),
        Reminder(pet: "Daisy", type: .vet),
        Reminder(pet: "Daisy", type: .walking, comment: "Very long comment...")
    ]
}
