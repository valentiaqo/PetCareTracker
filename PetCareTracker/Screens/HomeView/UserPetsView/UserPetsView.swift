//
//  UserPetsView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 11/10/2024.
//

import SwiftUI

struct UserPetsView: View {
    @Environment(\.modelContext) var context
    @State var viewModel = UserPetsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.white)
                
                VStack {
                    HStack {
                        Text("Your Pets")
                            .font(.roboto(.bold, 20))
                            .foregroundStyle(.onyx)
                        Spacer()
                    }
                    .padding(.top, 20)
                    
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: viewModel.rows, spacing: 20) {
                            ForEach(viewModel.pets) { pet in
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
                                    .padding(.leading, 5)
                            }
                        }
                    }
                    .frame(height: 100)
                    .sheet(item: $viewModel.selectedPet) { pet in
                        PetProfileView(pet: pet)
                            .presentationDetents([.height(370)])
                    }
                    .fullScreenCover(isPresented: $viewModel.isAddingPet) {
                        EditablePetProfileView(pet: viewModel.selectedPet)
                    }
                    .scrollIndicators(.hidden)
                }
                .padding()
            }
        }
        .frame(height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onAppear {
            viewModel.initializeDataManager(context: context)
            viewModel.fetchPets()
        }
        .onChange(of: viewModel.isAddingPet) {
            if !viewModel.isAddingPet {
                viewModel.fetchPets()
            }
        }
    }
}

#Preview {
    UserPetsView()
}
