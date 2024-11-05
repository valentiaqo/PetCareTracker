//
//  LabeledIconDatePicker.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 05/11/2024.
//

import SwiftUI

struct LabeledIconDatePicker: View {
    @Binding var selection: Date
    
    var body: some View {
        HStack {
            Image(LinearIcons.calendar.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
            
            DatePicker("Birthday",
                       selection: $selection,
                       in: Date()...Date().fiveYearsFromNow,
                       displayedComponents: .date)
            
            .font(.roboto(.medium, 17))
            .foregroundStyle(.secondary)
            .tint(.onyx)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1)
        )
    }
}

#Preview {
    LabeledIconDatePicker(selection: .constant(Date()))
}
