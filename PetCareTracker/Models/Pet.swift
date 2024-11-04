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
    var animalType: String
    var sex: String
    var breed: String? = nil
    var birthday: Date?
    var chip: String? = nil
    
    var cardBackgroundColor: String
}

struct PetMockData {
    static let samplePet = Pet(name: "Luna", animalType: Pet.AnimalType.dog.rawValue, sex: Pet.Sex.male.rawValue, breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softBlue")
    
    static let samplePets = [Pet(name: "Luna", animalType: Pet.AnimalType.dog.rawValue, sex: Pet.Sex.male.rawValue, breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softGreen"),
                             Pet(name: "Snowflake", animalType: Pet.AnimalType.cat.rawValue, sex: Pet.Sex.female.rawValue, breed: "Sphynx", chip: "1234567890123456", cardBackgroundColor: "softOrange"),
                             Pet(name: "Froggo baggins", animalType: Pet.AnimalType.frog.rawValue, sex: Pet.Sex.male.rawValue, birthday: Date(), cardBackgroundColor: "softPurple"),
                             Pet(name: "Turtle", animalType: Pet.AnimalType.turtle.rawValue, sex: Pet.Sex.female.rawValue, cardBackgroundColor: "softRed"),
                             Pet(name: "Lizzard", animalType: Pet.AnimalType.lizard.rawValue, sex: Pet.Sex.female.rawValue, cardBackgroundColor: "softYellow"),
    ]
}



