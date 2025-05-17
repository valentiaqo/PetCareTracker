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
    @State private var cachedEmptyState: EmptyReminderState = EmptyReminderState.randomEmptyReminderState()
    
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
                    
                    CalendarStripeView(selectedDate: viewModel.selectedDate,
                                       onDateSelected: { date in
                                            viewModel.updateSelectedDate(to: date)
                                        })
                    
                    ScrollView {
                        if viewModel.filteredReminders.isEmpty {
                            let emptyState = cachedEmptyState
                            
                            ContentUnavailableView(emptyState.title,
                                                   image: emptyState.iconName.rawValue,
                                                   description: Text(emptyState.subtitle))
                            .padding(.top, 80)
                            
                        } else {
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
        .sheet(isPresented: $viewModel.isAddingReminder, onDismiss: {
            viewModel.refreshRemindersIfNeeded()
        }) {
            AddReminderView()
        }
        .onAppear {
            viewModel.setup(context: context)
        }
        .onChange(of: viewModel.filteredReminders) { oldValue, newValue in
            if newValue.isEmpty {
                cachedEmptyState = EmptyReminderState.randomEmptyReminderState()
            }
        }
        .onChange(of: viewModel.selectedReminder) {
            viewModel.refreshRemindersIfNeeded()
        }
    }
}

struct EmptyReminderState {
    let iconName: LinearIcons
    let title: String
    let subtitle: String
    
    static func randomEmptyReminderState() -> EmptyReminderState {
        let basicOption =  EmptyReminderState(
            iconName: .pawPrint,
            title: "No reminders for this day",
            subtitle: "Tap the '+' to add a new one"
        )
            
        let options: [EmptyReminderState] = [
            EmptyReminderState(
                iconName: .hourglass,
                title: "No tasks today. Maybe it’s time for a catnap?",
                subtitle: "Enjoy the downtime."
            ),
            EmptyReminderState(
                iconName: .noteBlank,
                title: "Your reminder list is as blank as your pet’s thoughts.",
                subtitle: "Nothing scheduled yet."
            ),
            EmptyReminderState(
                iconName: .box,
                title: "Your pet’s to-do box is empty.",
                subtitle: "Looks like a chill day ahead."
            ),
            EmptyReminderState(
                iconName: .magnifyingGlass,
                title: "Sniffed around… no reminders to fetch.",
                subtitle: "Try adding something new."
            ),
            EmptyReminderState(
                iconName: .sun,
                title: "Nothing to do but chase sunshine.",
                subtitle: "You and your pet earned this break."
            ),
            EmptyReminderState(
                iconName: .bed,
                title: "Reminder list is asleep.",
                subtitle: "Just like your pet right now."
            ),
            EmptyReminderState(
                iconName: .cloud,
                title: "Just fluffy thoughts today.",
                subtitle: "No reminders for your furball."
            )
        ]
        
        return options.randomElement() ?? basicOption
    }
}


#Preview {
    UserRemindersView()
}
