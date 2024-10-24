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
    var breed: String = String()
    var birthday: Date?
    var chip: String = String()
    
    var cardBackgroundColor: String
}

struct MockData {
    static let samplePet = Pet(name: "Sharik", animalType: Pet.AnimalType.dog.rawValue, sex: Pet.Sex.male.rawValue, breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softBlue")
    
    static let samplePets = [Pet(name: "Sobaken", animalType: Pet.AnimalType.dog.rawValue, sex: Pet.Sex.male.rawValue, breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softGreen"),
                             Pet(name: "Kotik", animalType: Pet.AnimalType.cat.rawValue, sex: Pet.Sex.female.rawValue, breed: "Sphinx", chip: "1234567890123456", cardBackgroundColor: "softOrange"),
                             Pet(name: "Zabka", animalType: Pet.AnimalType.frog.rawValue, sex: Pet.Sex.male.rawValue, birthday: Date(), cardBackgroundColor: "softPurple"),
                             Pet(name: "Cherepashka dlinnaya", animalType: Pet.AnimalType.turtle.rawValue, sex: Pet.Sex.female.rawValue, cardBackgroundColor: "softRed"),
                             Pet(name: "Yashcherica", animalType: Pet.AnimalType.lizard.rawValue, sex: Pet.Sex.female.rawValue, cardBackgroundColor: "softYellow"),
    ]
}



