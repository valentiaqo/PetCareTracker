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
    
    static var randomSoftColor: Color {
        softColors.randomElement() ?? .gray
    }
    
    static func backgroundCategoryColor(for category: Activity.ActivityType) -> Color {
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
    
    static func foregroundCategoryColor(for category: Activity.ActivityType) -> Color {
        var color: Color = gray
        
        switch category {
        case .activity, .playtime: color = .darkYellow
        case .cleaning: color = .darkBlue
        case .feeding: color = .darkGgreen
        case .grooming: color = .darkOrange
        case .medication, .vet: color = .darkRed
        case .other: color = .darkOlive
        case .training: color = .darkPurple
        case .walking: color = .darkTeal
        }
        
        return color
    }
    
    //    static func getRandomUniqueColors(for pets: [Pet]) -> [AnimalType: Color] {
    //        var availableColors = Color.randomSoftColor.shuffled()
    //        var colorAssignment = [AnimalType: Color]()
    //
    //        for pet in pets {
    //            if let color = availableColors.popLast() {
    //                colorAssignment[pet.animalType] = color
    //            }
    //        }
    //        return colorAssignment
    //    }
    
    //    static func assingColorForPet(_ pet: Pet) {
    //        var availableColors = Color.randomSoftColor
    //        var uniqueColor: Color
    //
    //        for pet in MockData.samplePets {
    //            if UserDefaults.standard.string(forKey: UUID().uuidString) != nil {
    //
    //            }
    //        }
    //
    //        var colorAssignment: [String: Color]
    //        colorAssignment = [pet.id.uuidString: uniqueColor]
    //
    //    }
    //
    //    static func getColorForPet(_ pet: Pet) -> Color {
    //        pet.id
    //
    //
    //
    //        return .gray
    //    }
}
