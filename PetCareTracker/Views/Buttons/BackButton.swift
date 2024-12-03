//
//  BackButton.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 03/12/2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            dismiss()
        }) {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .medium))
                Text("Back")
                    .font(.roboto(.regular, 18))
            }
            .foregroundColor(.onyx)
        }
    }
}

#Preview {
    BackButton()
}
