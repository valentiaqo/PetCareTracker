//
//  Pet.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 12/10/2024.
//

import Foundation
import SwiftData

enum AnimalType: String, CaseIterable {
    case bird, cat, dog, frog, lizard, rabbit, turtle
    case none
}

enum Sex: String, CaseIterable {
    case male, female
    case none
}

class Pet: Identifiable, Hashable, Equatable {
    var id: UUID
    var name: String
    var animal: String
    var sex: String
    var breed: String?
    var birthday: Date?
    var chip: String?
    var cardBackgroundColor: String
    
    init(id: UUID = UUID(), name: String, animal: String, sex: String, breed: String? = nil, birthday: Date? = nil, chip: String? = nil, cardBackgroundColor: String) {
        self.id = id
        self.name = name
        self.animal = animal
        self.sex = sex
        self.breed = breed
        self.birthday = birthday
        self.chip = chip
        self.cardBackgroundColor = cardBackgroundColor
    }
    static func == (lhs: Pet, rhs: Pet) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Pet {
    var animalType: AnimalType? {
        get { AnimalType(rawValue: animal) }
        set { animal = newValue?.rawValue ?? String() }
    }
    
    var sexEnum: Sex? {
        get { Sex(rawValue: sex) }
        set { sex = newValue?.rawValue ?? String() }
    }
}

struct PetMockData {
    static var samplePet = Pet(name: "Luna", animal: "dog", sex: "male", breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softGreen")
    
    static var samplePets = [
        Pet(name: "Luna", animal: "dog", sex: "male", breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softGreen"),
        Pet(name: "Snowflake", animal: "cat", sex: "female", breed: "Sphynx", chip: "1234567890123456", cardBackgroundColor: "softOrange"),
        Pet(name: "Froggo baggins", animal: "frog", sex: "male", birthday: Date(), cardBackgroundColor: "softPurple"),
        Pet(name: "Turtle", animal: "turtle", sex: "female", cardBackgroundColor: "softRed"),
        Pet(name: "Lizzard", animal: "lizard", sex: "female", cardBackgroundColor: "softYellow")
    ]
}
