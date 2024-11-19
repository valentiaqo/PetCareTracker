//
//  PetCardImageView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 14/10/2024.
//

import SwiftUI

struct PetCardImageView: View {
    let animalType: Pet.AnimalType?
    let cardBackgroundColor: Color?
    
    var body: some View {
        ZStack {
            cardBackgroundColor
            
            if let animalType {
                Image(animalType.rawValue)
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
    PetCardImageView(animalType: Pet.AnimalType.cat, cardBackgroundColor: Color.softRed)
}
