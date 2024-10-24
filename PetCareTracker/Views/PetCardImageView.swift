//
//  PetCardImageView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 14/10/2024.
//

import SwiftUI

struct PetCardImageView: View {
    let pet: Pet?
    
    var backgroundColor: Color {
        // set a random, unique color at the beginning and then to change it if needed
        var backgroundColor = Color.gray
        
        for color in Color.softColors {
            if let pet {
                if Color(pet.cardBackgroundColor) == color {
                    backgroundColor = color
                }
            }
        }
        
        return backgroundColor
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            
            if let pet {
                Image(pet.animalType)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55, height: 55)
            }
        }
        .frame(width: 65, height: 65)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    PetCardImageView(pet: MockData.samplePet)
}
