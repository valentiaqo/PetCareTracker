//
//  String+Ext.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 17/11/2024.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        get {
            return self ?? ""
        }
        set {
            self = newValue.isEmpty ? nil : newValue
        }
    }
}
