//
//  StandardButton.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 25/12/2024.
//

import SwiftUI

struct StandardButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .foregroundColor(.cloudy)
                .font(.roboto(.regular, 18))
                .frame(minWidth: 100)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    StandardButton(title: "Tap here") {
        //
    }
}
