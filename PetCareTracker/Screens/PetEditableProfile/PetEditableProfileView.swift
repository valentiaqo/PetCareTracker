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
    
    @State private var keyboardObserver = KeyboardHeightObserver()
    
    private var focusColors: [Color] = {
        let darkColors = Color.darkColors.shuffled()
        return Array(darkColors.prefix(3))
    }()
    
    var body: some View {
        ZStack {
            Color(.cloudy)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 40) {
                    HStack(spacing: 15) {
                        if let animal = viewModel.animal {
                            PetCardImageView(animalType: Pet.AnimalType(rawValue: animal.lowercased()), cardBackgroundColor: viewModel.cardBackgroundColor)
                        }
                        
                        LabeledIconTextField(title: "Name", text: $viewModel.name, icon: LinearIcons.heart.rawValue, focusColor: focusColors[0])
                    }
                    
                    HStack {
                        LabeledIconMenu(title: "Animal", icon: LinearIcons.pawPrint.rawValue, pickerType: .animal, selection: $viewModel.animal.orEmpty)
                        LabeledIconMenu(title: "Sex", icon: LinearIcons.intersex.rawValue, pickerType: .sex, selection: $viewModel.sex.orEmpty)
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    LabeledIconDatePicker(selection: $viewModel.birthday)
                    LabeledIconTextField(title: "Breed", text: $viewModel.breed, icon: LinearIcons.list2.rawValue, focusColor: focusColors[1])
                    LabeledIconTextField(title: "Chip", text: $viewModel.chip, icon: LinearIcons.chip.rawValue, focusColor: focusColors[2])
                    
                    Spacer()

                    Button {
                        // save changes
                    } label: {
                        Text("Save")
                            .foregroundColor(.cloudy)
                            .font(.roboto(.regular, 18))
                    }
                    .frame(width: 150, height: 50)
                    .background(.onyx)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }
                .padding()
                
            }
            .scrollDisabled(keyboardObserver.keyboardHeight == 0 ? true : false)
        }
    }
}

#Preview {
    PetEditableProfileView()
}
