//
//  Activity.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 31/10/2024.
//

import Foundation

struct Reminder: Identifiable {
    enum ReminderType: String, CaseIterable {
        case activity, cleaning, medication, grooming, feeding, playtime, training, vet, walking, other
    }
    
    let id = UUID()
    
    var pet: String
    var reminderType: ReminderType
    var time: Date = Date()
    var date: Date = Date()
    var comment: String?
}

struct ReminderMockData {
    static let sampleReminder = Reminder(pet: "Luna", reminderType: .cleaning, time: Date(), comment: "Description")
    
    static let sampleReminders = [Reminder(pet: "Daisy", reminderType: .activity, time: Date(), comment: "Play fetch"),
                                   Reminder(pet: "Luna", reminderType: .cleaning, time: Date(), comment: "Description"),
                                  Reminder(pet: "Marco", reminderType: .feeding, time: Date(), comment: "1234567890123456"),
                                   Reminder(pet: "Gupulabupulabupu", reminderType: .grooming, time: Date(), comment: String()),
                                   Reminder(pet: "Eren", reminderType: .medication, time: Date()),
                                   Reminder(pet: "Mr.Denmark", reminderType: .other, time: Date(), comment: "Just long description"),
                                   Reminder(pet: "Gupgup", reminderType: .playtime, time: Date()),
                                   Reminder(pet: "Gupulabupulabupu", reminderType: .training, time: Date(), comment: "Very very very very very very long description"),
                                   Reminder(pet: "Daisy", reminderType: .vet, time: Date()),
                                   Reminder(pet: "Daisy", reminderType: .walking, time: Date(), comment: "Some long long long long long long long long long long long long long desctiprion")
    ]
}
