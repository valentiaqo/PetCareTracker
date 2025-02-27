//
//  UserActivityView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 05/11/2024.
//

import SwiftUI

struct UserRemindersView: View {
    @State private var isAddingReminder = false
    @State private var reminders: [Reminder] = ReminderMockData.sampleReminders
    @State private var selectedReminder: Reminder?
    
    var body: some View {
        ZStack {
            Color(.white)
            
            NavigationStack {
                VStack(spacing: 0) {
                    HStack {
                        Text("Reminders")
                            .font(.roboto(.bold, 20))
                            .foregroundStyle(.onyx)
                            .padding([.top, .leading], 16)
                        Spacer()
                        
                        Button {
                            isAddingReminder.toggle()
                        } label: {
                            Image(LinearIcons.plus.rawValue)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .tint(.onyx)
                        }
                        .padding([.top, .trailing], 16)
                    }
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())]) {
                            ForEach($reminders) { $reminder in
                                Button {
                                    selectedReminder = reminder
                                } label: {
                                    ReminderView(reminder: reminder)
                                        .frame(height: 90)
                                        .padding(.bottom, 5)
                                        .tint(.onyx)
                                        .scrollTransition { effect, phase in
                                            effect
                                                .scaleEffect(phase.isIdentity ? 1 : 0.9)
                                                .opacity(phase.isIdentity ? 1 : 0.5)
                                        }
                                }
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    .padding()
                    
                }
            }
        }
        .sheet(item: $selectedReminder) { reminder in
            ReminderDetailsView(reminder: Binding(get: {
                reminder
            }, set: { newValue in
                if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
                    reminders[index] = newValue
                }
            }))
            .presentationDetents([.height(400)])
        }
        .sheet(isPresented: $isAddingReminder) {
            AddReminderView(viewModel: AddReminderViewModel())
        }
//        .fullScreenCover(isPresented: $isAddingReminder) {
//            AddReminderView(viewModel: AddReminderViewModel())
//        }
        .frame(width: 360)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    UserRemindersView()
}
