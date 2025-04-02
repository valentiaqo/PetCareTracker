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
    
    var attributedTitle: AttributedString {
        var text = AttributedString("Reminder details: ")
        text.foregroundColor = .onyx
        
        var type = AttributedString(reminder.reminderType.rawValue.capitalized)
        type.foregroundColor = Color.foregroundCategoryColor(for: reminder.reminderType)
        
        var pet = AttributedString(" for \(reminder.pet)")
        pet.foregroundColor = .onyx
        
        return text + type + pet
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                
                VStack {
                    SheetGrabberView()
                    
                    Spacer()
                        .frame(maxHeight: 15)
                    
                    Text(attributedTitle)
                        .font(.roboto(.bold, 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    
                    Spacer()
                        .frame(maxHeight: 15)
                    
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
    @State private var isReadingComment = false
    
    var body: some View {
        Group {
            if let description = reminder.description, !description.isEmpty {
                ScrollView {
                    content
                }
                .scrollDisabled(!isReadingComment)
                .scrollIndicators(.never)
            } else {
                content
            }
        }
    }
    
    var content: some View {
        VStack(spacing: -15) {
            ReminderDetailView(imageName: LinearIcons.pawPrint.rawValue,
                               description: "Pet: \(reminder.pet)")
            ReminderDetailView(imageName: LinearIcons.listStar.rawValue,
                               description: "Category: \(reminder.reminderType.rawValue.capitalized)")
            ReminderDetailView(imageName: LinearIcons.clock.rawValue,
                               description: "Time: \(reminder.time.timeToString())")
            ReminderDetailView(imageName: LinearIcons.calendar.rawValue,
                               description: "Date: \(reminder.date.dateToString())")
            
            if let description = reminder.description, !description.isEmpty {
                let shouldShowReadMore = description.count > 16
                
                HStack(spacing: -15) {
                    ReminderDetailView(imageName: LinearIcons.listBullets.rawValue,
                                       description: "Comment: \(description)")
                    .lineLimit(isReadingComment ? nil : 1)
                    .animation(.interactiveSpring, value: isReadingComment)
                    
                    if shouldShowReadMore {
                        Button {
                            isReadingComment.toggle()
                        } label: {
                            Text("Read more")
                                .offset(x: -10)
                                .font(.roboto(.regular, 14))
                                .tint(.onyx)
                                .opacity(0.7)
                        }
                        .disabled(isReadingComment)
                        .opacity(isReadingComment ? 0 : 1)
                    }
                }
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
