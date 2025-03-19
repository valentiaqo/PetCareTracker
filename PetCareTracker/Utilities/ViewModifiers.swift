//
//  ViewModifiers.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 19/03/2025.
//

import SwiftUI

struct ScrollOnFocusModifier: ViewModifier {
    @FocusState.Binding var isFocused: Bool
    let id: String
    let proxy: ScrollViewProxy

    init(isFocused: FocusState<Bool>.Binding, id: String, proxy: ScrollViewProxy) {
        self._isFocused = isFocused
        self.id = id
        self.proxy = proxy
    }

    func body(content: Content) -> some View {
        content
            .focused($isFocused)
            .id(id)
            .onChange(of: isFocused) {
                if isFocused {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            proxy.scrollTo(id, anchor: .center)
                        }
                    }
                }
            }
    }
}

