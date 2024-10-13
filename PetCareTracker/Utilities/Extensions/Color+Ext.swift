//
//  Color+Ext.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 12/10/2024.
//

import SwiftUI

extension Color {
    static var randomSoftColor: Color {
        let colors: [Color] = [.softBlue, .softGray, .softGreen, .softOrange, .softPurple, .softRed, .softYellow]
        return colors.randomElement() ?? .white
    }
}
