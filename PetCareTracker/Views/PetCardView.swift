//
//  PetCardView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 12/10/2024.
//

import SwiftUI

struct PetCardView: View {
    let pet: Pet
    
    var body: some View {
        VStack {
            PetCardImageView(animalType: pet.animalType, cardBackgroundColor: pet.cardBackgroundColor)
            
            Text(pet.name)
                .font(.roboto(.medium, 17))
                .foregroundStyle(.onyx)
        }
        
        
    }
}

#Preview {
    PetCardView(pet: PetMockData.samplePet)
}
