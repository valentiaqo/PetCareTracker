//
//  ChipsView.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 24/12/2024.
//

import SwiftUI

struct ChipsView<Content: View>: View {
    @ViewBuilder var content: Content
    var body: some View {
        Group(subviews: content) { collection in
            let chunkedColletion = collection.chunked(3)
            
            VStack(alignment: .center, spacing: 10) {
                ForEach(chunkedColletion.indices, id: \.self) { index in
                    HStack(spacing: 10) {
                        ForEach(chunkedColletion[index]) { subview in
                            subview
                        }
                    }
                }
            }
        }
    }
}

extension SubviewsCollection {
    func chunked(_ size: Int) -> [[Subview]] {
        return stride(from: 0, to: count, by: size).map { index in
            Array(self[index..<Swift.min(index + size, count)])
        }
    }
}

struct Chip: Identifiable {
    let id = UUID()
    let name: String
    let frontColor: Color

    init(name: String, frontColor: Color = .onyx) {
        self.name = name
        self.frontColor = frontColor
    }
}

var reminderChips: [Chip] = Reminder.ReminderType.allCases.map { type in
    Chip(name: type.rawValue.capitalized, frontColor: Color.foregroundCategoryColor(for: type))
}

#Preview {
    ReminderSelectionView()
}
