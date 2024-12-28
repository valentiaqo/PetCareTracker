//
//  ReminderSelectionView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 24/12/2024.
//

import SwiftUI

struct ReminderSelectionView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var showAlert: Bool = false
    @Binding var selectedReminder: String?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.cloudy)
                    .ignoresSafeArea()
                VStack {
                    SheetGrabberView()
                    
                    HStack {
                        Text("\(selectedReminder == nil ? "Select reminder:" : "Selected remidner: \(selectedReminder.orEmpty.capitalized)")")
                            .font(.roboto(.bold, 20))
                            .foregroundStyle(.onyx)
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                    ChipsView {
                        ForEach(reminderChips) { chip in
                            Button {
                                selectedReminder = chip.name.lowercased()
                            } label: {
                                Text(chip.name)
                                    .font(.roboto(.medium, 16))
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 14)
                                    .padding(.horizontal, 18)
                                    .background(chip.frontColor, in: .capsule)
                                    .overlay(Capsule()
                                        .stroke(Color.onyx,
                                                lineWidth: chip.name.lowercased() == (selectedReminder ?? "") ? 2.5 : 1
                                        )
                                    )
                            }
                        }
                    }
                    .padding(.bottom)
                    
                    Spacer()
                    
                    StandardButton(title: "Select") {
                        if selectedReminder != nil {
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            showAlert.toggle()
                        }
                    }
                    .tint(selectedReminder != nil ? .onyx : .onyx.opacity(0.7))
                    .frame(width: 250)
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
    ReminderSelectionView(selectedReminder: .constant(Reminder.ReminderType.activity.rawValue))
}

#Preview {
    AddReminderView()
}
