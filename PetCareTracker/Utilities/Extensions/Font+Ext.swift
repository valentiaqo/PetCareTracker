//
//  CustomFont.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 09/10/2024.
//

import SwiftUI

enum FontWeight {
    case regular, medium, bold
}

extension Font {
    static let roboto: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .regular:
            Font.custom("Roboto-Regular", size: size)
        case .medium:
            Font.custom("Roboto-Medium", size: size)
        case .bold:
            Font.custom("Roboto-Bold", size: size)
        }
    }
}
