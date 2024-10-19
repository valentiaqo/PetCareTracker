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
    var breed: String = String()
    var birthday: Date?
    var chip: String = String()
    
    var cardBackgroundColor: String
}

struct MockData {
    static let samplePet = Pet(name: "Sharik", animalType: .dog, sex: .male, breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softBlue")
    
    static let samplePets = [Pet(name: "Sobaken", animalType: .dog, sex: .male, breed: "Golden retriever", birthday: Date(), chip: "1234567890123456", cardBackgroundColor: "softGreen"),
                             Pet(name: "Kotik", animalType: .cat, sex: .male, breed: "Sphinx", chip: "1234567890123456", cardBackgroundColor: "softOrange"),
                             Pet(name: "Zabka", animalType: .frog, sex: .female, birthday: Date(), cardBackgroundColor: "softPurple"),
                             Pet(name: "Cherepashka dlinnaya", animalType: .turtle, sex: .female, cardBackgroundColor: "softRed"),
                             Pet(name: "Yashcherica", animalType: .lizard, sex: .male, cardBackgroundColor: "softYellow"),
    ]
}
//[.softBlue, .softGreen, .softOrange, .softPurple, .softRed, .softYellow, .softTeal, .softPink, .softOlive]



