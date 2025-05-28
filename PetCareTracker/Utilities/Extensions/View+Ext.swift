//
//  View+Ext.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 19/03/2025.
//

import SwiftUI

extension View {
    func scrollOnFocus(isFocused: FocusState<Bool>.Binding, id: String, proxy: ScrollViewProxy) -> some View {
        self.modifier(ScrollOnFocusModifier(isFocused: isFocused, id: id, proxy: proxy))
    }
}
