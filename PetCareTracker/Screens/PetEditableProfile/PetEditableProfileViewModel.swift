//
//  PetEditableProfileViewModel.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 25/10/2024.
//

import SwiftUI

@Observable
class PetEditableProfileViewModel {
    var name = String()
    var animal: String?
    var sex: String?
    
    var birthday = Date()
    var breed = String()
    var chip = String()

    var cardBackgroundColor = Color.randomUniqueSoftColor(assignedColors: PetMockData.samplePets.map { $0.cardBackgroundColor })
}
