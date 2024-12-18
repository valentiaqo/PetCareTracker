//
//  UserActivityView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 05/11/2024.
//

import SwiftUI

struct UserRemindersView: View {
    var body: some View {
        ZStack {
            Color(.white)
            
            VStack(spacing: 0) {
                HStack {
                    Text("Reminders")
                        .font(.roboto(.bold, 20))
                        .foregroundStyle(.onyx)
                        .padding([.top, .leading], 16)
                    Spacer()
                }
                
                NavigationStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible())]) {
                            ForEach(ReminderMockData.sampleReminders) { activity  in
                                ReminderView(reminder: activity)
                                    .frame(height: 100)
                                    .padding(.bottom, 5)
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
    UserRemindersView()
}
