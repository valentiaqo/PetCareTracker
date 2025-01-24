//
//  ReminderDetailsView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 02/01/2025.
//

import SwiftUI

struct ReminderDetailsView: View {
    @State var viewModel = ReminderDetailsViewModel()
    @Binding var reminder: Reminder
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                
                VStack {
                    SheetGrabberView()
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text("Reminder details: ")
                            .foregroundColor(.onyx)
                        
                        Text(reminder.reminderType.rawValue.capitalized)
                            .foregroundColor(Color.foregroundCategoryColor(for: reminder.reminderType))
                        
                        Text(" for \(reminder.pet)")
                            .foregroundColor(.onyx)
                    }
                    .font(.roboto(.bold, 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    
                    
                    Spacer()
                    
                    DetailsSectionView(reminder: reminder)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    ButtonsSectionView(onComplete: viewModel.onComplete,
                                       onEdit: viewModel.onEdit,
                                       onDelete: viewModel.onDelete)
                }
            }
            .fullScreenCover(isPresented: $viewModel.isEditing) {
                AddReminderView(viewModel: AddReminderViewModel(from: reminder), isEditingReminder: true)
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
    let onComplete: () -> Void
    let onEdit: () -> Void
    let onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 50) {
            Button {
                onComplete()
            } label: {
                Image(LinearIcons.checkSquare.rawValue)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .tint(.darkGreen)
            }
            
            Button {
                onEdit()
            } label: {
                Image(LinearIcons.noteEdit.rawValue)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .tint(.onyx)
            }
            
            Button {
                onDelete()
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
