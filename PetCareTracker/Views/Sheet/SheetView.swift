//
//  SheetView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 16/12/2024.
//

import SwiftUI

struct SheetView: View {
    var title: String
    var desctiption: String
    var image: Config
    var button1: Config
    var button2: Config?
    
    var body: some View {
        VStack(spacing: 15) {
            Image(image.title)
                .foregroundStyle(image.foreground)
                .frame(width: 65, height: 65)
                .background(image.tint.gradient, in: .circle)
                .scaleEffect(1.1)
            
            Text(title)
                .font(.roboto(.bold, 22))
            
            Text(desctiption)
                .font(.roboto(.regular, 16))
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .foregroundStyle(.gray)
            
            ButtonView(button1)
            
            if let button2 {
                ButtonView(button2)
            }
        }
        .padding([.horizontal, .bottom], 15)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
                .padding(.top, 30)
        }
        .shadow(color: .black.opacity(0.12), radius: 8)
        .padding(.horizontal, 15)
    }
    
    @ViewBuilder
    func ButtonView(_ config: Config) -> some View {
        Button {
            
        } label: {
            Text(config.title)
                .font(.roboto(.bold, 18))
                .foregroundStyle(config.foreground)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(config.tint, in: .rect(cornerRadius: 10))
        }
    }
    
    struct Config {
        var title: String
        var tint: Color
        var foreground: Color
    }
}
