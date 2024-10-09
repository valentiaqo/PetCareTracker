//
//  CustomFont.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 09/10/2024.
//

import SwiftUI

enum FontWeight {
    case regular
    case semiBold
    case bold
}

extension Font {
    static let nunito: (FontWeight, CGFloat) -> Font = { fontType, size in
        switch fontType {
        case .regular:
            Font.custom("Nunito", size: size)
        case .semiBold:
            Font.custom("Nunito-SemiBold", size: size)
        case .bold:
            Font.custom("Nunito-Bold", size: size)
        }
    }
}
