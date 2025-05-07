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

@Model
class Pet: Identifiable, Hashable, Equatable {
    var id: UUID
    var name: String
    var animal: String
    var sex: String
    var breed: String?
    var birthday: Date?
    var chip: String?
    var cardBackgroundColor: String

    var animalType: AnimalType {
        get { AnimalType(rawValue: animal) ?? .none }
        set { animal = newValue.rawValue }
    }

    var sexType: Sex {
        get { Sex(rawValue: sex) ?? .none }
        set { sex = newValue.rawValue }
    }

    init(id: UUID = UUID(), name: String, animal: AnimalType, sex: Sex, breed: String? = nil, birthday: Date? = nil, chip: String? = nil, cardBackgroundColor: String) {
        self.id = id
        self.name = name
        self.animal = animal.rawValue
        self.sex = sex.rawValue
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

struct PetMockData {
    static var samplePet = Pet(name: "Luna", animal: .dog, sex: .male, breed: "Golden Retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softGreen")

    static var samplePets = [
        Pet(name: "Luna", animal: .dog, sex: .male, breed: "Golden Retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softGreen"),
        Pet(name: "Snowflake", animal: .cat, sex: .female, breed: "Sphynx", chip: "1234567890123456", cardBackgroundColor: "softOrange"),
        Pet(name: "Froggo Baggins", animal: .frog, sex: .male, birthday: Date(), cardBackgroundColor: "softPurple"),
        Pet(name: "Turtle", animal: .turtle, sex: .female, cardBackgroundColor: "softRed"),
        Pet(name: "Lizzard", animal: .lizard, sex: .female, cardBackgroundColor: "softYellow")
    ]
}
