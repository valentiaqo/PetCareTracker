//
//  PetEditableProfileView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 19/10/2024.
//

import SwiftUI

struct PetEditableProfileView: View {
    var pet: Pet? = nil
    
    @State var name = ""
    @State var breed = ""
    @State var chip = ""
    @State var sex = ""
    @State var animal = ""
    
    var body: some View {
        ZStack {
            Color(.cloudy)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                HStack(spacing: 15) {
                    PetCardImageView(pet: pet)
                    IconLabelTextField(title: "Name", text: $name, icon: LinearIcons.heart.rawValue)
                }
                
                IconLabelTextField(title: "Breed", text: $breed, icon: LinearIcons.list2.rawValue)
                IconLabelTextField(title: "Chip", text: $chip, icon: LinearIcons.chip.rawValue)
                IconLabelPicker(title: "Animal", icon: LinearIcons.pawPrint.rawValue, pickerType: .animal, selection: $animal)
            }
            .padding()
            
        }

    }
}

#Preview {
    PetEditableProfileView()
}
