//
//  PetCardImageView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 14/10/2024.
//

import SwiftUI

struct PetCardImageView: View {
    let animalType: String?
    let cardBackgroundColor: String?
    
    var backgroundColor: Color {
        // set a random, unique color at the beginning and then to change it if needed
        var backgroundColor = Color.silver
        
        for color in Color.softColors {
            if let cardBackgroundColor {
                if Color(cardBackgroundColor) == color {
                    backgroundColor = color
                }
            }
        }
        
        return backgroundColor
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            
            if let animalType {
                Image(animalType)
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
    PetCardImageView(animalType: Pet.AnimalType.cat.rawValue, cardBackgroundColor: CustomColors.softRed.rawValue)
}
