//
//  SheetGrabberView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 25/12/2024.
//

import SwiftUI

struct SheetGrabberView: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 5)
            .clipShape(.rect(cornerRadius: 20))
            .foregroundStyle(.onyx)
            .padding(.top, 10)
    }
}

#Preview {
    SheetGrabberView()
}
