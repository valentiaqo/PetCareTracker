//
//  Pet.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 12/10/2024.
//

import Foundation

enum PetSex: String {
    case male, female
}

enum AnimalType: String {
    case bird, cat, dog, frog, lizard, rabbit, turtle
}

struct Pet: Hashable, Identifiable {
    let id = UUID()
    
    var name: String
    var animalType: AnimalType
    var sex: PetSex
    var birthday: Date?
    var chip: Int?
}

struct MockData {
    static let samplePet = Pet(name: "Sharik", animalType: .dog, sex: .male, birthday: Date(), chip: 1234567890123456)

    static let samplePets = [Pet(name: "Sobaken", animalType: .dog, sex: .male, birthday: Date(), chip: 1234567890123456),
                      Pet(name: "Kotik", animalType: .cat, sex: .male),
                      Pet(name: "Zabka", animalType: .frog, sex: .female),
                      Pet(name: "Cherepashka dlinnaya", animalType: .turtle, sex: .female),
                      Pet(name: "Yashcherica", animalType: .lizard, sex: .male),
    ]
}



