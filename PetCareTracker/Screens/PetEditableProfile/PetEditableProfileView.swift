//
//  PetEditableProfileView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 19/10/2024.
//

import SwiftUI

struct PetEditableProfileView: View {
    var pet: Pet? = nil
    
//    @State var name = ""
//    @State var breed = ""
    
    var body: some View {
        ZStack {
            Color(.cloudy)
            
            VStack(spacing: 45) {
                //                PetCardImageView(pet: pet)
                
//                LabeledTextFieldView(title: "Name", text: $name, icon: LinearIcons.list2.rawValue)
//                LabeledTextFieldView(title: "Breed", text: $breed, icon: LinearIcons.pawPrint.rawValue)
                
            }
            .padding()
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PetEditableProfileView()
}
