//
//  IconLabelTextField.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 20/10/2024.
//

import SwiftUI

struct LabeledIconTextField: View {
    enum FieldType {
        case text, editor
    }
    
    var title: String
    var fieldType: FieldType = .text
    
    @Binding var text: String
    @FocusState private var isActive
    
    var icon: String?
    var focusColor: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            if fieldType == .text {
                TextField(String(), text: $text)
                    .padding(.leading, 50)
                    .padding([.top, .bottom, .trailing], 15)
                    .frame(height: 50)
                    .focused($isActive)
                    .submitLabel(.done)
                    .autocorrectionDisabled(true)
                    .font(.roboto(.regular, 17))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isActive ? focusColor : .gray,
                                    lineWidth: isActive ? 2.5 : 1.5)
                    )
            } else {
                TextEditor(text: $text)
                    .padding(.leading, 50)
                    .padding([.top, .bottom, .trailing], 15)
                    .frame(height: 100)
                    .focused($isActive)
                    .submitLabel(.return)
                    .autocorrectionDisabled(true)
                    .font(.roboto(.regular, 17))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isActive ? focusColor : .gray,
                                    lineWidth: isActive ? 2.5 : 1.5)
                    )
                    .scrollContentBackground(.hidden)
                    .background(.clear)
                    .toolbar {
                        ToolbarItem(placement: .keyboard) {
                            HStack {
                                Spacer()
                                Button("Done") {
                                    isActive = false
                                }
                            }
                        }
                    }
            }
            
            
            if let icon {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .padding([.leading, .top, .bottom], 15)
                    .foregroundStyle(isActive ? focusColor : .onyx)
                    .onTapGesture { isActive = true }
            }
            
            Text(title)
                .padding(.leading, 50)
                .padding([.top, .bottom], 15)
                .foregroundColor((isActive || !text.isEmpty) ? .onyx : .secondary)
                .offset(x: (isActive || !text.isEmpty) ? -40 : 0,
                        y: (isActive || !text.isEmpty) ? (fieldType == .text ? -40 : -65) : 0)
                .font(.roboto(.medium, 17))
                .onTapGesture { isActive = true }
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isActive)
        }
    }
}

#Preview {
    LabeledIconTextField(title: "Name", fieldType: .editor, text: .constant(""), icon: LinearIcons.heart.rawValue, focusColor: Color.randomDarkColor)
}

