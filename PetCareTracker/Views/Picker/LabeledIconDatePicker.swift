//
//  LabeledIconDatePicker.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 05/11/2024.
//

import SwiftUI

struct LabeledIconDatePicker: View {
    enum PickerType {
        case date, time
    }
    
    var title: String
    var pickerType: PickerType
    
    @Binding var selection: Date
    
    var body: some View {
        HStack {
            Image(pickerType == .date ? LinearIcons.calendar.rawValue : LinearIcons.clock.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundStyle(.onyx)
            
            DatePicker(title,
                       selection: $selection,
                       in: Date().twentyYearsAgo...Date(),
                       displayedComponents: pickerType == .date ? .date : .hourAndMinute)
            
            .font(.roboto(.medium, 17))
            .foregroundStyle((pickerType == .time && !selection.isNow) ||
                             (pickerType == .date && !selection.isToday) ? .onyx : .secondary
                        )
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
    LabeledIconDatePicker(title: "Birthday", pickerType: .date,selection: .constant(Date()))
}
