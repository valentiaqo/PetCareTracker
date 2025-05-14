//
//  PetEditableProfileViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 25/10/2024.
//

import SwiftUI
import SwiftData

// MARK: - EditablePetProfileViewModel
@MainActor
@Observable
final class EditablePetProfileViewModel: DataManagerInitializable {
    var mode: EditModePet = .add
    
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
    
    internal var dataManager: SwiftDataManager? = nil
    
    func setup(context: ModelContext, mode: EditModePet) {
        self.mode = mode
        initializeDataManager(context: context)
        
        switch mode {
        case .add:
            prepareForNewPet()
        case .edit(let pet):
            loadFromPet(pet)
        }
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
        if let pets = dataManager?.fetchAllPets() {
            cardBackgroundColor = Color.getColorName(of: Color.randomUniqueSoftColor(assignedColors: pets.map { $0.cardBackgroundColor })) ?? "Gray"
        }
    }
    
    func saveData() {
        guard isValidForm,
              let name,
              let animal = animal?.lowercased(),
              let sex = sex?.lowercased()
        else { return }
        
        switch mode {
        case .edit(let pet):
            pet.name = name
            pet.animal = animal
            pet.sex = sex
            pet.birthday = birthday
            pet.breed = breed
            pet.chip = chip
            pet.cardBackgroundColor = cardBackgroundColor.orEmpty
            dataManager?.updatePet(pet)
            
        case .add:
            let newPet = Pet(name: name,
                             animal: AnimalType(rawValue: animal) ?? .none,
                             sex: Sex(rawValue: sex) ?? .none,
                             breed: breed,
                             birthday: birthday,
                             chip: chip,
                             cardBackgroundColor: cardBackgroundColor ?? "Gray")
            dataManager?.addPet(newPet)
        }
    }
}
