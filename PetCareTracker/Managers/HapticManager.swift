//
//  HapticManager.swift
//  PetCareTracker
//
//  Created by Valentyn Ponomarenko on 22/05/2025.
//

import UIKit

final class HapticManager {
    static let shared = HapticManager()
    
    private let notificationGenerator = UINotificationFeedbackGenerator()

    func notify(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        notificationGenerator.prepare()
        notificationGenerator.notificationOccurred(type)
    }
}
