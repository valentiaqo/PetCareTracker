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
                    .padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 0))
                
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
                
                PetDescriptionView(pet: pet)
                
                    .frame(width: 360, height: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .shadow(color: .gray, radius: 10)
                
            }
        }
    }
}

struct PetDescriptionView: View {
    let pet: Pet
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack(spacing: -10) {
                PetDetailView(imageName: LinearIcons.pawPrint.rawValue, description: "Animal: \(pet.animalType.rawValue)")
                
                PetDetailView(imageName: pet.sex == .male ? LinearIcons.male.rawValue : LinearIcons.female.rawValue, description: "Sex: \(pet.sex.rawValue)")
                
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
            Text(description.capitalized)
                .font(.roboto(.medium, 20))
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    PetProfileView(pet: MockData.samplePet)
}
