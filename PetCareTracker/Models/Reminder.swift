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
    var time: Date
    var date: Date = Date()
    var description: String?
}

struct ReminderMockData {
    static let sampleReminder = Reminder(pet: "Daisy", reminderType: .medication, time: Date(), description: "Play fetch")
    
    static let sampleReminders = [Reminder(pet: "Daisy", reminderType: .activity, time: Date(), description: "Play fetch"),
                                   Reminder(pet: "Luna", reminderType: .cleaning, time: Date(), description: "Description"),
                                   Reminder(pet: "Marco", reminderType: .feeding, time: Date(), description: String()),
                                   Reminder(pet: "Gupulabupulabupu", reminderType: .grooming, time: Date(), description: String()),
                                   Reminder(pet: "Eren", reminderType: .medication, time: Date(), description: "Desc."),
                                   Reminder(pet: "Mr.Denmark", reminderType: .other, time: Date(), description: "Long description"),
                                   Reminder(pet: "Gupgup", reminderType: .playtime, time: Date(), description: String()),
                                   Reminder(pet: "Gupulabupulabupu", reminderType: .training, time: Date(), description: "Very very very very very very long description"),
                                   Reminder(pet: "Daisy", reminderType: .vet, time: Date(), description: String()),
                                   Reminder(pet: "Daisy", reminderType: .walking, time: Date(), description: "Some long desctiprion")
    ]
}

//Feeding
//Activity
//Playtime
//Grooming
//Habitat Cleaning
//Training
//Medication
//Vet Visit
//Walking
//Other
