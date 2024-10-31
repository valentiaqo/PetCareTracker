//
//  PetEditableProfileView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 19/10/2024.
//

import SwiftUI

struct PetEditableProfileView: View {
    var pet: Pet? = nil
    @State var viewModel = PetEditableProfileViewModel()
    
    var body: some View {
        ZStack {
            Color(.cloudy)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                HStack(spacing: 15) {
                    PetCardImageView(animalType: pet?.animalType, cardBackgroundColor: pet?.cardBackgroundColor)
                    LabeledIconTextField(title: "Name", text: $viewModel.name, icon: LinearIcons.heart.rawValue)
                }
                
                HStack {
                    LabeledIconMenu(title: "Animal", icon: LinearIcons.pawPrint.rawValue, pickerType: .animal, selection: $viewModel.animal)
                    LabeledIconMenu(title: "Sex", icon: LinearIcons.intersex.rawValue, pickerType: .sex, selection: $viewModel.sex)
                }
                
                LabeledIconTextField(title: "Breed", text: $viewModel.breed, icon: LinearIcons.list2.rawValue)
                LabeledIconTextField(title: "Chip", text: $viewModel.chip, icon: LinearIcons.chip.rawValue)
                
            }
            .padding()
            
        }

    }
}

#Preview {
    PetEditableProfileView()
}
