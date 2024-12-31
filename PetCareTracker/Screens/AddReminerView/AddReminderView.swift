//
//  AddReminderView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 06/12/2024.
//

import SwiftUI

struct AddReminderView: View {
    @State var viewModel = AddReminderViewModel()
    @State private var showAlert: Bool = false
    
    private var focusColor = Color.randomDarkColor
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
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
                .scrollIndicators(.hidden)
                
                Divider()
                    .padding(.top, 8)
                
                Group {
                    LinkButton(title: viewModel.selectedReminder == nil ? "Select reminder" : "Selected remidner",
                               icon: LinearIcons.listStar.rawValue,
                               selection: $viewModel.selectedReminder.orEmpty) {
                        viewModel.isChoosingReminder = true
                    }
                    
                    LabeledIconDatePicker(title: "Time",
                                          pickerType: .time,
                                          selection: $viewModel.selectedTime)
                    
                    LabeledIconDatePicker(title: "Date",
                                          pickerType: .date,
                                          selection: $viewModel.selectedDate)
                    
                    LabeledIconTextField(title: "Comments",
                                         text: $viewModel.description.orEmpty,
                                         icon: LinearIcons.listBullets.rawValue,
                                         focusColor: focusColor)
                    
                    StandardButton(title: "Add reminder") {
                        if viewModel.isValidForm {
                        } else {
                            showAlert.toggle()
                        }
                    }
                    .tint(viewModel.isValidForm ? .onyx : .onyx.opacity(0.7))
                    .frame(width: 250)
                }
                .padding(.top, 35)
                
                Spacer()
            }
            .sheet(isPresented: $viewModel.isChoosingReminder) {
                ReminderSelectionView(selectedReminder: $viewModel.selectedReminder)
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
            .padding()
            .navigationBarTitle("Add Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    BackButton()
                }
            }
        }
    }
}

#Preview {
    AddReminderView()
}
