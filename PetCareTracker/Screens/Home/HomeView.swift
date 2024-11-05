//
//  HomeView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 11/10/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(.cloudy)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack {
                    Text("Hello, Valentyn ")
                        .font(.roboto(.bold, 30))
                    
                    Spacer()
                    
                    Button {
                        // action: open settings
                    } label: {
                        Image(LinearIcons.settings.rawValue)
                    }
                }
                .padding()
                
                UserPetsView()
                UserActivityView()
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
