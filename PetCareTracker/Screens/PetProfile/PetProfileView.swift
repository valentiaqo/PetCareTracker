//
//  PetProfileView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 14/10/2024.
//

import SwiftUI

struct PetProfileView: View {
    let pet: Pet
    
    var body: some View {
        ZStack {
            Color(.cloudy)
                .ignoresSafeArea()
            
            VStack {
                
                Rectangle()
                    .frame(width: 50, height: 5)
                    .clipShape(.rect(cornerRadius: 20))
                    .foregroundStyle(.onyx)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                
                
                PetTitleView(pet: pet)
                
                
                PetDetailsView(pet: pet)
                    .frame(width: 360, height: calculatedHeightForPetDetailsView())
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
            }
        }
    }
    
    func calculatedHeightForPetDetailsView() -> CGFloat {
        var viewHeight: CGFloat = 240
        if pet.birthday == nil && pet.chip == nil && pet.breed == nil {
            viewHeight = 80
        } else if (pet.birthday == nil && pet.chip == nil) || (pet.birthday == nil && pet.breed == nil) || (pet.breed == nil && pet.chip == nil) {
            viewHeight = 120
        } else if pet.birthday == nil || pet.chip == nil || pet.breed == nil {
            viewHeight = 180
        }
        
        return viewHeight
    }
}

struct PetTitleView: View {
    let pet: Pet
    
    var body: some View {
        HStack {
            PetCardImageView(animalType: pet.animalType, cardBackgroundColor: pet.cardBackgroundColor)
                .padding(.trailing)
            
            Text(pet.name)
                .font(.roboto(.bold, 30))
            
            Spacer()
            
            Button {
                
            } label: {
                Image(LinearIcons.edit.rawValue)
            }
        }
        .padding()
    }
}

struct PetDetailsView: View {
    let pet: Pet
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack(spacing: -15) {
                PetDetailView(imageName: LinearIcons.pawPrint.rawValue, description: "Animal: \(pet.animalType.capitalized), \(pet.sex.lowercased())")
                
                if pet.breed != nil {
                    PetDetailView(imageName: LinearIcons.list2.rawValue, description: "Breed: \(pet.breed ?? String())")
                }
                
                if let birthday = pet.birthday {
                    PetDetailView(imageName: LinearIcons.birthday.rawValue, description: "Birthday: \(birthday.dateToString())")
                }
                
                if pet.chip != nil {
                    PetDetailView(imageName: LinearIcons.chip.rawValue, description: "Chip: \(pet.chip ?? String())")
                }
            }
        }
    }
}


struct PetDetailView: View {
    let imageName: String
    let description: String
    
    var body: some View {
        HStack {
            Image("\(imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text(description)
                .font(.roboto(.regular, 18))
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    PetProfileView(pet: PetMockData.samplePet)
}
