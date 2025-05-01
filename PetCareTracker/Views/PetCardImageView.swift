//
//  PetCardImageView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 14/10/2024.
//

import SwiftUI

struct PetCardImageView: View {
    let animalType: AnimalType?
    let cardBackgroundColor: Color?
    
    init(animalType: AnimalType, cardBackgroundColor: Color?) {
        self.animalType = animalType
        self.cardBackgroundColor = cardBackgroundColor
    }
    
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
    PetCardImageView(animalType: PetMockData.samplePet.animalType ?? .none, cardBackgroundColor: Color.softRed)
}
