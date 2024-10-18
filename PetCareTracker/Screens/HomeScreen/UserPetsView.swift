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
                        LazyHGrid(rows: viewModel.columns, spacing: 20) {
                            ForEach(MockData.samplePets) { pet in
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
                        }
                    }
                    .sheet(item: $viewModel.selectedPet) { pet in
                        PetProfileView(pet: pet)
                            .presentationDetents([.medium])
                    }
                    //                    .navigationDestination(for: Pet.self) { pet in
                    //                        PetProfileView(pet: pet)
                    //                    }
                    //                    .sheet(isPresented: $isPresented) {
                    //                        PetProfileView(pet: selectedPet!)
                    //                            .presentationDetents([.large])
                    //                    }
                    .scrollIndicators(.hidden)
                }
                
                
                
            }
            .padding()
            
        }
        .frame(width: 360, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .shadow(color: .gray, radius: 10)
        
    }
}

#Preview {
    UserPetsView()
}
