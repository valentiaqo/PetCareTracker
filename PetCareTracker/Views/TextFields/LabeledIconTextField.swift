//
//  IconLabelTextField.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 20/10/2024.
//

import SwiftUI

struct LabeledIconTextField: View {
    var title: String
    
    @Binding var text: String
    @FocusState private var isActive
    
    var icon: String?
    var focusColor: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField(String(), text: $text)
                .padding(EdgeInsets(top: 15, leading: 50, bottom: 15, trailing: 15))
                .frame(height: 50)
                .focused($isActive)
                .submitLabel(.done)
                .autocorrectionDisabled(true)
                .font(.roboto(.regular, 17))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke((isActive || !text.isEmpty) ? focusColor : .gray,
                                lineWidth: (isActive || !text.isEmpty) ? 2.5 : 1.5)
                )
            
            if let icon {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 0))
                    .foregroundStyle((isActive || !text.isEmpty) ? focusColor : .onyx)
                    .onTapGesture { isActive = true }
            }

            Text(title)
                .padding(EdgeInsets(top: 15, leading: 50, bottom: 15, trailing: 0))
                .foregroundColor((isActive || !text.isEmpty) ? .onyx : .secondary)
                .offset(x: (isActive || !text.isEmpty) ? -40 : 0,
                        y: (isActive || !text.isEmpty) ? -40 : 0)
                .font(.roboto(.medium, 17))
                .onTapGesture { isActive = true }
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isActive)
        }
    }
}

#Preview {
    LabeledIconTextField(title: "Name", text: .constant(""), icon: LinearIcons.heart.rawValue, focusColor: Color.randomDarkColor)
}

