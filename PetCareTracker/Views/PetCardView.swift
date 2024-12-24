//
//  PetCardView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 12/10/2024.
//

import SwiftUI

struct PetCardView: View {
    let pet: Pet
    var isSelected: Bool = false
    var isSelectable: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                PetCardImageView(animalType: pet.animal, cardBackgroundColor: Color(pet.cardBackgroundColor))
                    .opacity(isSelectable ? (isSelected ? 1 : 0.6) : 1)
                
                Image(LinearIcons.checkFat.rawValue)
                    .offset(x: 45, y: -45)
                    .scaleEffect(0.8)
                    .opacity(isSelectable ? (isSelected ? 1 : 0) : 0)
                    .foregroundStyle(.onyx)
            }
            
            Text(pet.name)
                .font(.roboto(.regular, 17))
                .foregroundStyle(.onyx)
                .lineLimit(1)
        }
    }
}

#Preview {
    PetCardView(pet: PetMockData.samplePet)
}
