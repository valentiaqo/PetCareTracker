//
//  ActivityView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 31/10/2024.
//

import SwiftUI

struct ReminderView: View {
    let reminder: Reminder
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.backgroundCategoryColor(for: reminder.reminderType)
                .ignoresSafeArea()
            
            HStack(alignment: .center) {
                Text(reminder.time.timeToString())
                    .padding(.leading)
                    .font(.roboto(.medium, 17))
                
                Divider()
                    .padding(.vertical, 15)
                    .padding(.horizontal, 5)
                
                ReminderDescriptionView(reminder: reminder)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.foregroundCategoryColor(for: reminder.reminderType), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ReminderDescriptionView: View {
    let reminder: Reminder
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(reminder.date.dateToString())
                
                Circle()
                    .frame(width: 5, height: 5)
                
                Text(reminder.pet)
                    .lineLimit(0)
                    .padding(.trailing)
            }
            .offset(y: -5)
            .font(.roboto(.regular, 16))
            .foregroundStyle(Color.foregroundCategoryColor(for: reminder.reminderType))
            
            Text(reminder.reminderType.rawValue.capitalized)
                .font(.roboto(.medium, 17))
                .offset(y: -5)
            
            if let description = reminder.description, description != String() {
                Text(description)
                    .padding(.trailing)
                    .font(.roboto(.regular, 15))
                    .lineLimit(0)
            }
        }
    }
}

#Preview {
    ReminderView(reminder: ReminderMockData.sampleReminder)
}
