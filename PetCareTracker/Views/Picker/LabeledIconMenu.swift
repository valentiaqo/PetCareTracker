//
//  IconLabelPicker.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 21/10/2024.
//

import SwiftUI

struct LabeledIconMenu: View {
    enum PickerType {
        case sex, animal
    }
    
    var title: String
    var icon: String?
    var pickerType: PickerType
    @Binding var selection: String
    
    var pickerOptions: [String] {
        switch pickerType {
        case .sex:
            return Pet.Sex.allCases.map { $0.rawValue.capitalized }
        case .animal:
            return Pet.AnimalType.allCases.map { $0.rawValue.capitalized }
        }
    }
    
    var body: some View {
        Menu {
            ForEach(pickerOptions, id: \.self) { option in
                Button(action: {
                    selection = option
                }) {
                    Text(option)
                }
            }
        } label: {
            ZStack {
                HStack {
                    if let icon {
                        Image(icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.onyx)
                    }
                    
                    ZStack {
                        Text(title)
                            .font(.roboto(.medium, 17))
                            .foregroundStyle(!selection.isEmpty ? .onyx : .secondary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: selection.isEmpty ? 0 : -40,
                                    y: selection.isEmpty ? 0 : -40)
                            .animation(.spring, value: selection.isEmpty)
                        
                        Text(selection.capitalized)
                            .font(.roboto(.regular, 17))
                            .foregroundStyle(.onyx)
                            .opacity(selection.isEmpty ? 0 : 1)
                            .offset(x: -20)
                    }
                    
                    Spacer()
                    
                    Image(LinearIcons.chevronCircleDown.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.onyx)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1.5)
                )
            }
            .frame(height: 50)
        }
    }
}


#Preview {
    LabeledIconMenu(title: "Animal", icon: LinearIcons.intersex.rawValue, pickerType: .animal, selection: .constant("Dog"))
}
