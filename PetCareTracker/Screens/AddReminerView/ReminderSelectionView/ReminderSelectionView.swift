//
//  ReminderSelectionView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 24/12/2024.
//

import SwiftUI

struct ReminderSelectionView: View {
    var body: some View {
        ChipsView {
            ForEach(reminderChips) { chip in
                Button {
                    
                } label: {
                    Text(chip.name)
                        .font(.roboto(.regular, 16))
                        .foregroundStyle(.white)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .background(chip.frontColor, in: .capsule)
                }
            }
        }
    }
}

#Preview {
    ReminderSelectionView()
}
