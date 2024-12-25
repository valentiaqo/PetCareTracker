//
//  PetProfileView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 14/10/2024.
//

import SwiftUI

struct PetProfileView: View {
    @State var viewModel = PetProfileViewModel()
    @State var pet: Pet
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                
                VStack {
                    SheetGrabberView()
                    
                    HStack {
                        PetCardImageView(animalType: pet.animal, cardBackgroundColor: Color(pet.cardBackgroundColor))
                            .padding(.trailing)
                        
                        Text(pet.name)
                            .font(.roboto(.bold, 30))
                        
                        Spacer()
                        
                        Button {
                            viewModel.isEditingPet = true
                        } label: {
                            Image(LinearIcons.edit.rawValue)
                                .tint(.onyx)
                        }
                    }
                    .padding()
                    
                    PetDetailsView(pet: pet)
                        .frame(width: 360, height: calculatedHeightForPetDetailsView())
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.isEditingPet) {
            EditablePetProfileView(pet: pet)
        }
    }
    
    func calculatedHeightForPetDetailsView() -> CGFloat {
        let defaultHeight: CGFloat = 240
        let minimalHeight: CGFloat = 80
        let reducedHeight: CGFloat = 120
        let mediumHeight: CGFloat = 180

        switch (pet.birthday != nil, pet.chip != nil, pet.breed != nil) {
        case (false, false, false):
            return minimalHeight
        case (false, false, true), (false, true, false), (true, false, false):
            return reducedHeight
        case (false, true, true), (true, false, true), (true, true, false):
            return mediumHeight
        default:
            return defaultHeight
        }
    }
}

struct PetDetailsView: View {
    let pet: Pet
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack(spacing: -15) {
                PetDetailView(imageName: LinearIcons.pawPrint.rawValue, description: "Animal: \(pet.animal.rawValue.capitalized), \(pet.sex.rawValue.lowercased())")
                
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
