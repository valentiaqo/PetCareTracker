//
//  UserActivityView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 05/11/2024.
//

import SwiftUI

struct UserActivityView: View {
    var body: some View {
        ZStack {
            Color(.white)
            
            VStack {
                HStack {
                    Text("Activity")
                        .font(.roboto(.bold, 20))
                        .foregroundStyle(.onyx)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                    Spacer()
                }
                
                NavigationStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())]) {
                            ForEach(ActivityMockData.sampleActivities) { activity  in
                                ActivityView(activity: activity)
                                    .frame(height: 100)
                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                                    .scrollTransition { effect, phase in
                                        effect
                                            .scaleEffect(phase.isIdentity ? 1 : 0.9)
                                            .opacity(phase.isIdentity ? 1 : 0.5)
                                    }
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    .padding()
                }
            }
        }
        .frame(width: 360)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    UserActivityView()
}
