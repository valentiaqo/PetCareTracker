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
        if pet.birthday == nil && pet.chip == String() && pet.breed == String() {
            viewHeight = 80
        } else if (pet.birthday == nil && pet.chip == String()) || (pet.birthday == nil && pet.breed == String()) || (pet.breed == String() && pet.chip == String()) {
            viewHeight = 120
        } else if pet.birthday == nil || pet.chip == String() || pet.breed == String() {
            viewHeight = 180
        }
        
        return viewHeight
    }
}

struct PetTitleView: View {
    let pet: Pet
    
    var body: some View {
        HStack {
            PetCardImageView(pet: pet)
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
            VStack(spacing: -10) {
                PetDetailView(imageName: LinearIcons.pawPrint.rawValue, description: "Animal: \(pet.animalType.rawValue.capitalized), \(pet.sex.rawValue)")
                
                if !pet.breed.isEmpty {
                    PetDetailView(imageName: LinearIcons.list2.rawValue, description: "Breed: \(pet.breed)")
                }
                
                if let birthday = pet.birthday {
                    PetDetailView(imageName: LinearIcons.birthday.rawValue, description: "Birthday: \(birthday.toString())")
                }
                
                if !pet.chip.isEmpty {
                    PetDetailView(imageName: LinearIcons.chip.rawValue, description: "Chip: \(pet.chip)")
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
                .font(.roboto(.regular, 20))
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    PetProfileView(pet: MockData.samplePet)
}
