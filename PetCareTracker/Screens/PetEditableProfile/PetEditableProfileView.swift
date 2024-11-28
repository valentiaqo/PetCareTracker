//
//  PetEditableProfileView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 19/10/2024.
//

import SwiftUI

struct PetEditableProfileView: View {
    var pet: Pet?
    @State var viewModel: PetEditableProfileViewModel
    
    @State private var keyboardObserver = KeyboardHeightObserver()
    
    private var focusColors: [Color] = {
        let darkColors = Color.darkColors.shuffled()
        return Array(darkColors.prefix(3))
    }()
    
    init(pet: Pet? = nil) {
        viewModel = PetEditableProfileViewModel()
        if let pet = pet {
            viewModel.loadFromPet(pet)
        } else {
            viewModel.prepareForNewPet()
        }
    }
    
    var body: some View {
        ZStack {
            Color(.cloudy)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 40) {
                    HStack(spacing: 15) {
                        if let animal = viewModel.animal {
                            PetCardImageView(animalType: Pet.AnimalType(rawValue: animal.lowercased()), cardBackgroundColor: Color(viewModel.cardBackgroundColor.orEmpty))
                        }
                        
                        LabeledIconTextField(title: "Name", text: $viewModel.name.orEmpty, icon: LinearIcons.heart.rawValue, focusColor: focusColors[0])
                    }
                    
                    HStack {
                        LabeledIconMenu(title: "Animal", icon: LinearIcons.pawPrint.rawValue, pickerType: .animal, selection: $viewModel.animal.orEmpty)
                        LabeledIconMenu(title: "Sex", icon: LinearIcons.intersex.rawValue, pickerType: .sex, selection: $viewModel.sex.orEmpty)
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    LabeledIconDatePicker(selection: $viewModel.birthday)
                    LabeledIconTextField(title: "Breed", text: $viewModel.breed.orEmpty, icon: LinearIcons.list2.rawValue, focusColor: focusColors[1])
                    LabeledIconTextField(title: "Chip", text: $viewModel.chip.orEmpty, icon: LinearIcons.chip.rawValue, focusColor: focusColors[2])
                    
                    Spacer()

                    Button {
                        if viewModel.isValidForm {
                            print("yes")
//                            viewModel.saveChanges(for: pet)
                        } else {
                            print("no")
                            // present alert
                        }
                    } label: {
                        Text("Save")
                            .foregroundColor(.cloudy)
                            .font(.roboto(.regular, 18))
                            .frame(minWidth: 100)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .tint(viewModel.isValidForm ? .onyx : .onyx.opacity(0.7))
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
