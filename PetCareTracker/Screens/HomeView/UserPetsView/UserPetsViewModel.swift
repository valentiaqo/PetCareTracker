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
final class UserPetsViewModel: DataManagerInitializable {
    let rows: [GridItem] = [GridItem(.flexible())]
    
    var pets: [Pet] = []
    var selectedPet: Pet?
    var isAddingPet = false
    
    internal var dataManager: SwiftDataManager? = nil
    
    private func fetchPets() {
        pets = dataManager?.fetchAllPets() ?? []
    }
    
    func setup(context: ModelContext) {
        initializeDataManager(context: context)
        fetchPets()
    }
    
    func refreshPetsIfNeeded() {
        if !isAddingPet {
            fetchPets()
        }
    }
}
