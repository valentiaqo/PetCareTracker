//
//  ActivityView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 31/10/2024.
//

import SwiftUI

struct ActivityView: View {
    let activity: Activity
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Color.backgroundCategoryColor(for: activity.activityType)
                .ignoresSafeArea()
            
            HStack(alignment: .center) {
                
                Text(activity.time.timeToString())
                    .padding(.leading)
                    .font(.roboto(.medium, 20))
                
                Divider()
                    .padding()
                
                ActivityDescriptionView(activity: activity)
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.foregroundCategoryColor(for: activity.activityType), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ActivityDescriptionView: View {
    let activity: Activity
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(activity.date.dateToString())
                
                Circle()
                    .frame(width: 5, height: 5)
                
                Text(activity.pet)
            }
            .font(.roboto(.regular, 17))
            .foregroundStyle(Color.foregroundCategoryColor(for: activity.activityType))
            
            Text(activity.activityType.rawValue.capitalized)
                .font(.roboto(.medium, 20))
            Text(activity.description ?? String())
                .padding(.trailing)
                .font(.roboto(.regular, 16))
                .lineLimit(0)
        }
    }
}

#Preview {
    ActivityView(activity: ActivityMockData.sampleActivity)
}
