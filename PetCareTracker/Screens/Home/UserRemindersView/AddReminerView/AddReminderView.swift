//
//  AddReminderView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 06/12/2024.
//

import SwiftUI

struct AddReminderView: View {
    @State var viewModel: AddReminderViewModel
    @State private var showAlert: Bool = false
    @State private var keyboardObserver = KeyboardHeightObserver()
    
    @FocusState private var isCommentFocused: Bool
    
    var isEditingReminder: Bool
    
    private var focusColor = Color.randomDarkColor
    
    init(viewModel: AddReminderViewModel, isEditingReminder: Bool = false) {
        self._viewModel = State(initialValue: viewModel)
        self.isEditingReminder = isEditingReminder
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
                                        // save the reminder
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
                .navigationBarTitle("Add Reminder")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        BackButton()
                    }
                }
                .padding()
                .scrollIndicators(.never)
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
            }
        }
    }
}

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
                ForEach(PetMockData.samplePets) { pet in
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
        .padding(.top, isCommentFocused ? 10 : 0)
        .animation(.easeIn(duration: 0.8), value: isCommentFocused)
        .scrollOnFocus(isFocused: $isCommentFocused, id: "commentsSection", proxy: proxy)
    }
}


#Preview {
    AddReminderView(viewModel: AddReminderViewModel())
}
