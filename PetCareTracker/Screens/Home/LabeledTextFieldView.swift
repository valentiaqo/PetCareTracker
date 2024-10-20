//
//  LabeledTextFieldView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 20/10/2024.
//

import SwiftUI

struct LabeledTextFieldView: View {
    var title: String
    
    @Binding var text: String
    @FocusState private var isActive
    
    var icon: String?
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField(String(), text: $text)
                .padding(EdgeInsets(top: 15, leading: 50, bottom: 15, trailing: 15))
                .frame(height: 50)
                .focused($isActive)
                .submitLabel(.done)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .font(.roboto(.regular, 17))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isActive ? .onyx : .secondary,
                                lineWidth: isActive ? 2 : 1)
                )
            
            if let icon {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
            }
            
            Text(title)
                .padding(EdgeInsets(top: 15, leading: 50, bottom: 15, trailing: 0))
                .offset(x: (isActive || !text.isEmpty) ? -50 : 0,
                        y: (isActive || !text.isEmpty) ? -50 : 0)
                .font(.roboto(.medium, 17))
                .foregroundStyle(isActive ? .onyx : .secondary)
                .animation(.spring, value: isActive)
        }
    }
}

