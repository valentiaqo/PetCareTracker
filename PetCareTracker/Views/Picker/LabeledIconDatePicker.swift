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
                .foregroundStyle(.onyx)
            
            DatePicker("Birthday",
                       selection: $selection,
                       in: Date().twentyYearsAgo...Date(),
                       displayedComponents: .date)
            
            .font(.roboto(.medium, 17))
            .foregroundStyle(!selection.isToday ? .onyx : .secondary)
            .tint(.onyx)
        }
        .padding(.horizontal)
        .frame(height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1.5)
        )
    }
}

#Preview {
    LabeledIconDatePicker(selection: .constant(Date()))
}
