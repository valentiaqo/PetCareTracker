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
                    .font(.roboto(.medium, 18))
                
                Divider()
                    .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
//                    .padding()
                
                ActivityDescriptionView(reminder: reminder)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.foregroundCategoryColor(for: reminder.reminderType), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ActivityDescriptionView: View {
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
            .font(.roboto(.regular, 17))
            .foregroundStyle(Color.foregroundCategoryColor(for: reminder.reminderType))
            
            Text(reminder.reminderType.rawValue.capitalized)
                .font(.roboto(.medium, 18))
                .offset(y: -5)
            Text(reminder.description ?? String())
                .padding(.trailing)
                .font(.roboto(.regular, 16))
                .lineLimit(0)
        }
    }
}

#Preview {
    ReminderView(reminder: ReminderMockData.sampleReminder)
}
