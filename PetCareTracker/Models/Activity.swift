//
//  Activity.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 31/10/2024.
//

import Foundation

struct Activity: Identifiable {
    enum ActivityType: String, CaseIterable {
        case activity, cleaning, feeding, grooming, medication, other, playtime, training, vet, walking
    }
    
    let id = UUID()
    
    var pet: String
    var activityType: ActivityType
    var time: Date
    var date: Date = Date()
    var description: String?
}

struct ActivityMockData {
    static let sampleActivity = Activity(pet: "Daisy", activityType: .medication, time: Date(), description: "Play fetch")
    
    static let sampleActivities = [Activity(pet: "Daisy", activityType: .activity, time: Date(), description: "Play fetch"),
                                   Activity(pet: "Luna", activityType: .cleaning, time: Date(), description: "Description"),
                                   Activity(pet: "Marco", activityType: .feeding, time: Date(), description: String()),
                                   Activity(pet: "Gupulabupulabupu", activityType: .grooming, time: Date(), description: String()),
                                   Activity(pet: "Eren", activityType: .medication, time: Date(), description: "Desc."),
                                   Activity(pet: "Mr.Denmark", activityType: .other, time: Date(), description: "Long description"),
                                   Activity(pet: "Gupgup", activityType: .playtime, time: Date(), description: String()),
                                   Activity(pet: "Daisy", activityType: .training, time: Date(), description: "Very very very very very very long description"),
                                   Activity(pet: "Daisy", activityType: .vet, time: Date(), description: String()),
                                   Activity(pet: "Daisy", activityType: .walking, time: Date(), description: "Some long desctiprion")
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
