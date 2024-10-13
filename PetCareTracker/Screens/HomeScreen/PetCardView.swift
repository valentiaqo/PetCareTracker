//
//  PetCardView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 12/10/2024.
//

import SwiftUI

struct PetCardView: View {
    let pet: Pet
    
    let backgroundColor = Color.randomSoftColor
    
    var body: some View {
        VStack {
            ZStack {
                backgroundColor
                
                Image(pet.animalType.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55, height: 55)
            }
            .frame(width: 65, height: 65)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(pet.name)
                .font(.roboto(.medium, 17))
                .foregroundStyle(.onyx)
        }
        
        
    }
}

#Preview {
    PetCardView(pet: MockData.samplePet)
}
