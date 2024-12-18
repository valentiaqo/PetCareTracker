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
        ScrollView(.horizontal) {
            LazyHGrid(rows: viewModel.rows, spacing: 20) {
                ForEach(PetMockData.samplePets) { pet in
                    Button {
                        viewModel.selectedPet = pet
                    } label: {
                        PetCardView(pet: pet)
                            .frame(width: 80)
                            .scrollTransition { effect, phase in
                                effect
                                    .scaleEffect(phase.isIdentity ? 1 : 0.7)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    AddReminderView()
}
