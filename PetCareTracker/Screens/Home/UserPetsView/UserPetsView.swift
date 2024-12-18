//
//  UserPetsView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 11/10/2024.
//

import SwiftUI

struct UserPetsView: View {
    @State var viewModel = UserPetsViewModel()
    
    var body: some View {
        ZStack {
            Color(.white)
            
            VStack {
                HStack {
                    Text("Your Pets")
                        .font(.roboto(.bold, 20))
                        .foregroundStyle(.onyx)
                    Spacer()
                }
                
                NavigationStack {
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: viewModel.rows, spacing: 20) {
                            ForEach(PetMockData.samplePets) { pet in
                                NavigationLink(value: pet) {
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
                            
                            Button {
                                viewModel.isAddingPet = true
                            } label: {
                                AddButton()
                                    .padding(.bottom, 25)
                            }
                        }
                    }
                    .sheet(item: $viewModel.selectedPet) { pet in
                        PetProfileView(pet: pet)
                            .presentationDetents([.medium])
                    }
                    .fullScreenCover(isPresented: $viewModel.isAddingPet) {
                        EditablePetProfileView()
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .padding()
            
        }
        .frame(width: 360, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    UserPetsView()
}
