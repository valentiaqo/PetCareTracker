//
//  ReminderDetailsView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 02/01/2025.
//

import SwiftUI

struct ReminderDetailsView: View {
    @Binding var reminder: Reminder
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                
                VStack {
                    SheetGrabberView()
                    //                        .offset(y: 5)
                    
                    Spacer()
                    
                    HStack {
                        Text("Reminder details: \(reminder.reminderType.rawValue.capitalized) for \(reminder.pet)")
                            .font(.roboto(.bold, 18))
                        
                        Text("Scheduled")
                            .font(.caption)
                            .padding(5)
                            .background(Color.backgroundCategoryColor(for: reminder.reminderType))
                            .foregroundColor(.foregroundCategoryColor(for: reminder.reminderType))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 10)
                    
                    DetailsSectionView(reminder: reminder)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    ButtonsSectionView()
                }
            }
        }
    }
}

struct DetailsSectionView: View {
    let reminder: Reminder
    
    var body: some View {
        VStack(spacing: -15) {
            ReminderDetailView(imageName: LinearIcons.pawPrint.rawValue,
                               description: "Pet: \(reminder.pet)")
            ReminderDetailView(imageName: LinearIcons.listStar.rawValue,
                               description: "Category: \(reminder.reminderType.rawValue.capitalized)")
            ReminderDetailView(imageName: LinearIcons.clock.rawValue,
                               description: "Time: \(reminder.time.timeToString())")
            ReminderDetailView(imageName: LinearIcons.calendar.rawValue,
                               description: "Date: \(reminder.date.dateToString())")
            
            if reminder.description != nil && reminder.description != String() {
                ReminderDetailView(imageName: LinearIcons.listBullets.rawValue,
                                   description: "Comment: \(reminder.description.orEmpty)")
            }
        }
    }
}

struct ButtonsSectionView: View {
    var body: some View {
        HStack(spacing: 50) {
            Button {
                //                viewModel.onComplete()
            } label: {
                Image(LinearIcons.checkSquare.rawValue)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .tint(.darkGreen)
            }
            
            Button {
                //                viewModel.onEdit()
            } label: {
                Image(LinearIcons.noteEdit.rawValue)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .tint(.onyx)
            }
            
            Button {
                //                viewModel.onDetele()
            } label: {
                Image(LinearIcons.xSquare.rawValue)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .tint(.darkRed)
            }
        }
        .padding([.top, .bottom], 10)
    }
}

struct ReminderDetailView: View {
    let imageName: String
    let description: String
    
    var body: some View {
        HStack {
            Image("\(imageName)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            Text(description)
                .font(.roboto(.regular, 18))
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    ReminderDetailsView(reminder: .constant(ReminderMockData.sampleReminder))
}
