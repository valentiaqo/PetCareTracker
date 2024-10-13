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
                                    PetCardView(pet: pet)
                                        .frame(width: 80)
                                }
                            }
                        }
                    }
//                    .navigationDestination(for: Pet.self) { pet in
//                        PetProfiveView(pet: pet)
//                    }
                    .scrollIndicators(.hidden)
                }
                
                    
                
            }
            .padding()
            
        }
        .frame(width: 330, height: 170)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .softGray, radius: 10)
        
    }
}

#Preview {
    UserPetsView()
}
