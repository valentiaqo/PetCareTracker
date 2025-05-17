//
//  Date+Ext.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 15/10/2024.
//

import Foundation

extension Date {
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
    
    var isNow: Bool {
        let now = Date()
        let calendar = Calendar.current
        
        let nowComponents = calendar.dateComponents([.hour, .minute], from: now)
        let selfComponents = calendar.dateComponents([.hour, .minute], from: self)
        
        return nowComponents.hour == selfComponents.hour &&
        nowComponents.minute == selfComponents.minute
    }
    
    static func getWeekDates(for offset: Int) -> [Date] {
        let calendar = Calendar.current
        let today = Date()
        
        let startOfCurrentWeek = calendar.dateInterval(of: .weekOfYear, for: today)?.start ?? today
        let startOfWeek = calendar.date(byAdding: .weekOfYear, value: offset, to: startOfCurrentWeek) ?? today
        
        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
    
    static func isSameDay(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
        let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
        return components1 == components2
    }
    
    func dateToString(as style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
    
    func timeToString(format: String = "HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func stripTime() -> Date {
        Calendar.current.startOfDay(for: self)
    }
}
