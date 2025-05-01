//
//  PetEditableProfileViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 25/10/2024.
//

import SwiftUI

@Observable
class EditablePetProfileViewModel {
    var name: String?
    var animal: String?
    var sex: String?
    
    var birthday = Date()
    var breed: String?
    var chip: String?
    
    var cardBackgroundColor: String?
    
    var isValidForm: Bool {
        name != nil && animal != nil && sex != nil
    }
    
    func loadFromPet(_ pet: Pet) {
        name = pet.name
        animal = pet.animal
        sex = pet.sex
        breed = pet.breed
        chip = pet.chip
        cardBackgroundColor = pet.cardBackgroundColor
        if let birthday = pet.birthday {
            self.birthday = birthday
        }
    }
    
    func prepareForNewPet() {
        cardBackgroundColor = Color.getColorName(of: Color.randomUniqueSoftColor(assignedColors: PetMockData.samplePets.map { $0.cardBackgroundColor })) ?? "Gray"
    }
    
    func saveChanges(for pet: inout Pet?) {
        if isValidForm {
            guard let name, let animal = animal?.lowercased(), let sex = sex?.lowercased() else { return }
            
            if pet == nil {
                pet = Pet(name: name,
                          animal: animal,
                          sex: sex, breed: breed,
                          birthday: birthday,
                          chip: chip,
                          cardBackgroundColor: cardBackgroundColor ?? "Gray")
            } else {
                pet?.name = name
                pet?.animal = animal
                pet?.sex = sex
                pet?.birthday = birthday
                pet?.breed = breed
                pet?.chip = chip
                pet?.cardBackgroundColor = cardBackgroundColor.orEmpty
            }
        }
    }
}
