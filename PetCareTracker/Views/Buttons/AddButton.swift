//
//  AddButton.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 30/10/2024.
//

import SwiftUI

struct AddButton: View {
    var body: some View {
        ZStack {
            Color(.platinum)
            
            Image(LinearIcons.plus.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            
        }
        .frame(width: 65, height: 65)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                .foregroundStyle(.onyx)
        )
    }
}

#Preview {
    AddButton()
}
