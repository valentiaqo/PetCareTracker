//
//  UserRemindersView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 05/11/2024.
//

import SwiftUI

struct UserRemindersView: View {
    @Environment(\.modelContext) var context
    @State private var viewModel: UserRemindersViewModel
    
    init() {
        self._viewModel = State(initialValue: UserRemindersViewModel())
    }
    
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
                            viewModel.isAddingReminder.toggle()
                        } label: {
                            Image(LinearIcons.plus.rawValue)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .tint(.onyx)
                        }
                        .padding([.top, .trailing], 16)
                    }
                    
                    CalendarStripeView(selectedDate: $viewModel.selectedDate)
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())]) {
                            ForEach(viewModel.filteredReminders) { reminder in
                                Button {
                                    viewModel.selectedReminder = reminder
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
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .sheet(item: $viewModel.selectedReminder) { reminder in
            ReminderDetailsView(reminder: Binding(get: {
                reminder
            }, set: { newValue in
                if let index = viewModel.reminders.firstIndex(where: { $0.id == reminder.id }) {
                    viewModel.reminders[index] = newValue
                }
            }))
            .presentationDetents([.height(400)])
        }
        .sheet(isPresented: $viewModel.isAddingReminder) {
            AddReminderView()
        }
        .onAppear {
            viewModel.setup(context: context)
        }
        .onChange(of: viewModel.isAddingReminder) {
            viewModel.refreshRemindersIfNeeded()
        }
        .onChange(of: viewModel.selectedReminder) {
            viewModel.refreshRemindersIfNeeded()
        }
    }
}

#Preview {
    UserRemindersView()
}
