//
//  CalendarStripeView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 26/03/2025.
//

import SwiftUI

struct CalendarStripeView: View {
    @Binding var selectedDate: Date
    
    @State private var currentWeekOffset = 0
    
    let weeksRange = -104...104
    
    var body: some View {
        TabView(selection: $currentWeekOffset) {
            ForEach(weeksRange, id: \.self) { offset in
                WeekView(weekOffset: offset, selectedDate: $selectedDate)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 50)
        .padding(.top)
        .padding(.horizontal)
    }
}

struct WeekView: View {
    let weekOffset: Int
    @Binding var selectedDate: Date
    
    private let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter
    }()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }()
    
    var body: some View {
        let weekDays = Date.getWeekDates(for: weekOffset)
        
        HStack(spacing: 0) {
            ForEach(weekDays, id: \.self) { date in
                VStack(spacing: 2) {
                    Text(dayFormatter.string(from: date))
                    Text(dateFormatter.string(from: date))
                }
                .font(.roboto(.regular, 15))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(Date.isSameDay(date, selectedDate) ? Color.onyx : Color.clear)
                .background(date.isToday ? Color.onyx.opacity(0.15) : Color.clear)
                .foregroundStyle(Date.isSameDay(date, selectedDate) ? .white : .onyx)
                .cornerRadius(15)
                .onTapGesture {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        selectedDate = date
                    }
                }
            }
        }
    }
}

#Preview {
    UserRemindersView()
}
