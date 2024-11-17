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
        return Array(darkColors.prefix(6))
    }()
    
    var body: some View {
        ZStack {
            Color(.cloudy)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 40) {
                    Spacer()
                    
                    HStack(spacing: 15) {
                        PetCardImageView(animalType: viewModel.animal?.lowercased(), cardBackgroundColor: pet?.cardBackgroundColor)
                        LabeledIconTextField(title: "Name", text: $viewModel.name, icon: LinearIcons.heart.rawValue, focusColor: focusColors[0])
                    }
                    
                    HStack {
                        LabeledIconMenu(title: "Animal", icon: LinearIcons.pawPrint.rawValue, pickerType: .animal, selection: $viewModel.animal.orEmpty, focusColor: focusColors[1])
                        LabeledIconMenu(title: "Sex", icon: LinearIcons.intersex.rawValue, pickerType: .sex, selection: $viewModel.sex, focusColor: focusColors[2])
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    LabeledIconDatePicker(selection: $viewModel.birthday, focusColor: focusColors[3])
                    LabeledIconTextField(title: "Breed", text: $viewModel.breed, icon: LinearIcons.list2.rawValue, focusColor: focusColors[4])
                    LabeledIconTextField(title: "Chip", text: $viewModel.chip, icon: LinearIcons.chip.rawValue, focusColor: focusColors[5])
                    
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
