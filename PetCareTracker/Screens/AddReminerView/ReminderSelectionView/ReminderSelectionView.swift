//
//  ReminderSelectionView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 24/12/2024.
//

import SwiftUI

struct ReminderSelectionView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var viewModel = ReminderSelectionViewModel()
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                VStack {
                    SheetGrabberView()
                    
                    Spacer()
                    
                    ChipsView {
                        ForEach(reminderChips) { chip in
                            Button {
                                viewModel.selectedReminder = Reminder.ReminderType(rawValue: chip.name.lowercased())
                            } label: {
                                Text(chip.name)
                                    .font(.roboto(.medium, 16))
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 14)
                                    .padding(.horizontal, 18)
                                    .background(chip.frontColor, in: .capsule)
                                    .overlay(Capsule()
                                        .stroke(Color.onyx,
                                                lineWidth: chip.name.lowercased() == (viewModel.selectedReminder?.rawValue ?? "") ? 2.5 : 1
                                        )
                                    )
                            }
                        }
                    }
                    
                    Spacer()
                    
                    StandardButton(title: "Add reminder") {
                        if viewModel.selectedReminder != nil {
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            showAlert.toggle()
                        }
                    }
                    .tint(viewModel.selectedReminder != nil ? .onyx : .onyx.opacity(0.7))
                }
            }
            .floatingBottomSheet(isPresented: $showAlert) {
                SheetView(title: "Missing information",
                          desctiption: "Please select a reminder",
                          image: .init(
                            title: "info",
                            tint: .onyx,
                            foreground: .white),
                          button1: .init(
                            title: "Ok",
                            tint: .onyx,
                            foreground: .white))
                .presentationDetents([.height(350)])
            }
        }
    }
}

#Preview {
    ReminderSelectionView()
}
