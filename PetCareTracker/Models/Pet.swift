//
//  Pet.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 12/10/2024.
//

import Foundation

struct Pet: Hashable, Identifiable {
    enum Sex: String, CaseIterable{
        case male, female
    }

    enum AnimalType: String, CaseIterable {
        case bird, cat, dog, frog, lizard, rabbit, turtle
    }
    
    let id = UUID()
    
    var name: String
    var animal: AnimalType
    var sex: Sex
    var breed: String?
    var birthday: Date?
    var chip: String?
    
    var cardBackgroundColor: String
}

struct PetMockData {
    static var samplePet = Pet(name: "Luna", animal: .dog, sex: .male, breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softBlue")
    
    static var samplePets = [Pet(name: "Luna", animal: .dog, sex: .male, breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softGreen"),
                             Pet(name: "Snowflake", animal: .cat, sex: .female, breed: "Sphynx", chip: "1234567890123456", cardBackgroundColor: "softOrange"),
                             Pet(name: "Froggo baggins", animal: .frog, sex: .male, birthday: Date(), cardBackgroundColor: "softPurple"),
                             Pet(name: "Turtle", animal: .turtle, sex: .female, cardBackgroundColor: "softRed"),
                             Pet(name: "Lizzard", animal: .lizard, sex: .female, cardBackgroundColor: "softYellow"),
    ]
}



