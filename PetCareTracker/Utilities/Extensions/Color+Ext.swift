//
//  Color+Ext.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 12/10/2024.
//

import SwiftUI

enum CustomColors: String {
    case softBlue, softGreen, softOrange, softPurple, softRed, softYellow, softTeal, softPink, softOlive
    case paleBlue, paleGreen, paleOrange, palePurple, paleRed, paleYellow, paleTeal, palePink, paleOlive
    case darkBlue, darkGreen, darkOrange, darkPurple, darkRed, darkYellow, darkTeal, darkOlive
    
    static var softColors: [CustomColors] {
        return [.softBlue, .softGreen, .softOrange, .softPurple, .softRed, .softYellow, .softTeal, .softPink, .softOlive]
    }
}

extension Color {
    static var softColors: [Color] = [Color(CustomColors.softBlue.rawValue),
                                      Color(CustomColors.softGreen.rawValue),
                                      Color(CustomColors.softOrange.rawValue),
                                      Color(CustomColors.softPurple.rawValue),
                                      Color(CustomColors.softRed.rawValue),
                                      Color(CustomColors.softYellow.rawValue),
                                      Color(CustomColors.softTeal.rawValue),
                                      Color(CustomColors.softPink.rawValue),
                                      Color(CustomColors.softOlive.rawValue)
    ]
    
    static var darkColors: [Color] = [Color(CustomColors.darkBlue.rawValue),
                                      Color(CustomColors.darkGreen.rawValue),
                                      Color(CustomColors.darkOrange.rawValue),
                                      Color(CustomColors.darkPurple.rawValue),
                                      Color(CustomColors.darkRed.rawValue),
                                      Color(CustomColors.darkYellow.rawValue),
                                      Color(CustomColors.darkTeal.rawValue),
                                      Color(CustomColors.darkOlive.rawValue)
    ]
    
    private static let colorNameMapping: [Color: CustomColors] = [
        Color(CustomColors.softBlue.rawValue): .softBlue,
        Color(CustomColors.softGreen.rawValue): .softGreen,
        Color(CustomColors.softOrange.rawValue): .softOrange,
        Color(CustomColors.softPurple.rawValue): .softPurple,
        Color(CustomColors.softRed.rawValue): .softRed,
        Color(CustomColors.softYellow.rawValue): .softYellow,
        Color(CustomColors.softTeal.rawValue): .softTeal,
        Color(CustomColors.softPink.rawValue): .softPink,
        Color(CustomColors.softOlive.rawValue): .softOlive,
    ]
    
    static var randomSoftColor: Color {
        softColors.randomElement() ?? .gray
    }
    
    static var randomDarkColor: Color {
        darkColors.randomElement() ?? .gray
    }
    
    static func backgroundCategoryColor(for category: Reminder.ReminderType) -> Color {
        var color: Color = gray
        
        switch category {
        case .activity, .playtime: color = .softYellow
        case .cleaning: color = .softBlue
        case .feeding: color = .softGreen
        case .grooming: color = .softOrange
        case .medication, .vet: color = .softRed
        case .other: color = .softOlive
        case .training: color = .softPurple
        case .walking: color = .softTeal
        }
        
        return color
    }
    
    static func foregroundCategoryColor(for category: Reminder.ReminderType) -> Color {
        var color: Color = gray
        
        switch category {
        case .activity, .playtime: color = .darkYellow
        case .cleaning: color = .darkBlue
        case .feeding: color = .darkGreen
        case .grooming: color = .darkOrange
        case .medication, .vet: color = .darkRed
        case .other: color = .darkOlive
        case .training: color = .darkPurple
        case .walking: color = .darkTeal
        }
        
        return color
    }
    
    static func randomUniqueSoftColor(assignedColors: [String]) -> Color {
        let allSoftColorStrings = CustomColors.softColors.map { $0.rawValue }
        let availableColors = allSoftColorStrings.filter { !assignedColors.contains($0) }
        
        guard !availableColors.isEmpty else { return Color(allSoftColorStrings.randomElement() ?? "silver") }
        
        let randomColorName = availableColors.randomElement() ?? "silver"
        return Color(randomColorName)
    }
    
    static func getColorName(of color: Color) -> String? {
        return colorNameMapping[color]?.rawValue
    }
}
