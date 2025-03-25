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
}
