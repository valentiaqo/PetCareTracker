//
//  UserPetsViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 13/10/2024.
//

import SwiftUI

@Observable
final class UserPetsViewModel {
    let rows: [GridItem] = [GridItem(.flexible())]
    var selectedPet: Pet?
    var isAddingPet = false
}
