//
//  AddReminderView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 06/12/2024.
//

import SwiftUI

struct AddReminderView: View {
    @State var viewModel = AddReminderViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
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
                }
                .scrollIndicators(.hidden)
                
//                Divider()
                
                LinkButton(
                    title: viewModel.selectedReminder == nil ? "Select reminder" : "Selected remidner",
                    icon: LinearIcons.listStar.rawValue,
                    selection: $viewModel.selectedReminder.orEmpty) {
                        viewModel.isChoosingReminder = true
                }
                    .frame(width: 300)
            }
            .sheet(isPresented: $viewModel.isChoosingReminder) {
                ReminderSelectionView(selectedReminder: $viewModel.selectedReminder)
                    .presentationDetents([.height(350)])
            }
            .padding()
            .navigationBarTitle("Add Reminder")
        }
    }
}

#Preview {
    AddReminderView()
}
