//
//  AddReminderView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 06/12/2024.
//

import SwiftUI

struct AddReminderView: View {
    @State var viewModel = AddReminderViewModel()
    
    private var focusColor = Color.randomDarkColor
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 40) {
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
                
                LinkButton(
                    title: viewModel.selectedReminder == nil ? "Select reminder" : "Selected remidner",
                    icon: LinearIcons.listStar.rawValue,
                    selection: $viewModel.selectedReminder.orEmpty) {
                        viewModel.isChoosingReminder = true
                }
                
                /*
                 
                 HStack
                 
                 TimePicker
                 
                 DatePicker
                 */
                
                LabeledIconTextField(
                    title: "Comments",
                    text: $viewModel.description.orEmpty,
                    icon: LinearIcons.listBullets.rawValue,
                    focusColor: focusColor)
                
//                StandardButton(title: "Select") {
//                    if viewModel.isValidForm {
//                    } else {
//                        showAlert.toggle()
//                    }
//                }
//                .tint(viewModel.isValidForm ? .onyx : .onyx.opacity(0.7))
//                .frame(width: 250)
                
                Spacer()
            }
            .sheet(isPresented: $viewModel.isChoosingReminder) {
                ReminderSelectionView(selectedReminder: $viewModel.selectedReminder)
                    .presentationDetents([.height(400)])
            }
            .padding()
            .navigationBarTitle("Add Reminder")
        }
    }
}

#Preview {
    AddReminderView()
}
