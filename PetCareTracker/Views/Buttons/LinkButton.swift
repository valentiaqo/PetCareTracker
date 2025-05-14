//
//  LinkButton.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 26/12/2024.
//

import SwiftUI

struct LinkButton: View {
    var title: String
    var icon: String?
    @Binding var selection: String
    
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                HStack {
                    if let icon {
                        Image(icon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.onyx)
                    }
                    
                    ZStack(alignment: .leading) {
                        Text(title)
                            .font(.roboto(.medium, 17))
                            .foregroundStyle(!selection.isEmpty ? .onyx : .secondary)
                            .offset(x: selection.isEmpty ? 0 : -40,
                                    y: selection.isEmpty ? 0 : -40)
                            .animation(.spring, value: selection.isEmpty)
                        
                        Text(selection.capitalized)
                            .font(.roboto(.regular, 17))
                            .foregroundStyle(.onyx)
                            .opacity(selection.isEmpty ? 0 : 1)
                    }
                    
                    Spacer()
                    
                    Image(LinearIcons.chevronCircleRight.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.onyx)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1.5)
                )
            }
            .frame(height: 50)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    AddReminderView()
}
