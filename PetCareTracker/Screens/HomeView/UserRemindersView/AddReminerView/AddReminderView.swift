//
//  AddReminderView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 06/12/2024.
//

import SwiftUI

//MARK: - AddReminderView
enum EditModeReminder {
    case add
    case edit(Reminder)
}

struct AddReminderView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State var viewModel: AddReminderViewModel
    @State private var showAlert: Bool = false
    
    @FocusState private var isCommentFocused: Bool
    
    var reminder: Reminder?
    var isEditingReminder: Bool
    
    private var focusColor = Color.randomDarkColor
    
    init(isEditingReminder: Bool = false, reminder: Reminder? = nil) {
        self._viewModel = State(initialValue: AddReminderViewModel())
        self.isEditingReminder = isEditingReminder
        self.reminder = reminder
    }
 
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        VStack(spacing: 0) {
                            PetSelectionView(viewModel: $viewModel)
                            
                            Divider()
                                .padding(.top, 8)
                            
                            Group {
                                ReminderFormView(viewModel: $viewModel,
                                                 isCommentFocused: $isCommentFocused,
                                                 showAlert: $showAlert,
                                                 focusColor: focusColor,
                                                 proxy: proxy)
                                
                                StandardButton(title: isEditingReminder ? "Update reminder" : "Add reminder") {
                                    if viewModel.isValidForm {
                                        viewModel.saveData()
                                        dismiss()
                                    } else {
                                        showAlert.toggle()
                                    }
                                }
                                .tint(viewModel.isValidForm ? .onyx : .onyx.opacity(0.7))
                                .frame(width: 250)
                            }
                            .padding(.top, 35)
                            .padding(.horizontal, 1)
                            
                            Spacer()
                        }
                    }
                    .scrollBounceBehavior(.basedOnSize, axes: [.vertical])
                }
            }
            .navigationBarTitle("Add Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                }
            }
            .padding()
            .scrollIndicators(.never)
            .background(Color(.cloudy).ignoresSafeArea())
        }
        .sheet(isPresented: $viewModel.isChoosingReminder) {
            ReminderTypeSelectionView(selectedReminder: $viewModel.selectedReminder)
                .presentationDetents([.height(400)])
        }
        .floatingBottomSheet(isPresented: $showAlert) {
            SheetView(title: "Missing information",
                      desctiption: "Please make sure that pet and reminder are selected",
                      image: .init(
                        title: "info",
                        tint: .onyx,
                        foreground: .white),
                      button1: .init(
                        title: "Ok",
                        tint: .onyx,
                        foreground: .white))
            .presentationDetents([.height(350)])
        }
        .onAppear {
            initializeViewModel()
        }
    }
    
    private func initializeViewModel() {
        let currentMode: EditModeReminder = reminder.map { .edit($0) } ?? .add
        viewModel.setup(context: context, mode: currentMode)
    }
}


//MARK: - PetSelectionView
struct PetSelectionView: View {
    @Binding var viewModel: AddReminderViewModel
    
    var body: some View {
        HStack {
            Text("Choose pet")
                .font(.roboto(.bold, 20))
                .foregroundStyle(.onyx)
            Spacer()
        }
        .padding(.bottom, 8)
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: viewModel.rows, spacing: 20) {
                ForEach(viewModel.pets) { pet in
                    Button {
                        viewModel.selectedPet = pet
                    } label: {
                        PetCardView(pet: pet,
                                    isSelected: viewModel.selectedPet?.id == pet.id,
                                    isSelectable: true)
                        .frame(width: 80)
                        .scrollTransition { effect, phase in
                            effect
                                .scaleEffect(phase.isIdentity ? 1 : 0.7)
                        }
                    }
                }
            }
            .frame(height: 120)
        }
    }
}

//MARK: - ReminderFormView
struct ReminderFormView: View {
    @Binding var viewModel: AddReminderViewModel
    @FocusState.Binding var isCommentFocused: Bool
    @Binding var showAlert: Bool
    
    var focusColor: Color
    var proxy: ScrollViewProxy
    
    var body: some View {
        LinkButton(title: viewModel.selectedReminder == nil ? "Select reminder" : "Selected remidner",
                   icon: LinearIcons.listStar.rawValue,
                   selection: $viewModel.selectedReminder.orEmpty) {
            viewModel.isChoosingReminder = true
        }
        
        LabeledIconDatePicker(title: "Date",
                              pickerType: .date,
                              selection: $viewModel.selectedDate)
        
        LabeledIconDatePicker(title: "Time",
                              pickerType: .time,
                              selection: $viewModel.selectedTime)
        
        LabeledIconTextField(title: "Comments",
                             fieldType: .editor,
                             text: $viewModel.description.orEmpty,
                             icon: LinearIcons.listBullets.rawValue,
                             focusColor: focusColor)
        .padding(.top, 5)
        .scrollOnFocus(isFocused: $isCommentFocused, id: "commentsSection", proxy: proxy)
    }
}


#Preview {
    AddReminderView()
}
