//
//  UserPetsViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 13/10/2024.
//

import SwiftUI
import SwiftData

@MainActor
@Observable
final class UserPetsViewModel {
    let rows: [GridItem] = [GridItem(.flexible())]
    
    var pets: [Pet] = []
    var selectedPet: Pet?
    var isAddingPet = false
    
    private var dataManager: SwiftDataManager? = nil
    
    func initializeDataManager(context: ModelContext) {
        if dataManager == nil {
            dataManager = SwiftDataManager(context: context)
        }
    }
    
    func fetchPets() {
        pets = dataManager?.fetchAllPets() ?? []
    }
    
}
