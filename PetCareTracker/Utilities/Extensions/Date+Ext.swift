//
//  Date+Ext.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 15/10/2024.
//

import Foundation

extension Date {
    var fiveYearsFromNow: Date {
        Calendar.current.date(byAdding: .year, value: 5, to: Date()) ?? Date()
    }
    
    var twentyYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -20, to: Date()) ?? Date()
    }
    
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
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
