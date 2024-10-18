//
//  Date+Ext.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 15/10/2024.
//

import Foundation

extension Date {
    func toString(as style: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        return formatter.string(from: self)
    }
}
