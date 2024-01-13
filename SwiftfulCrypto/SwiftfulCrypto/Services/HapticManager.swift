//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/13/24.
//

import Foundation
import SwiftUI

final class HapticManager {
  static private let generator = UINotificationFeedbackGenerator()
  
  static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    generator.notificationOccurred(type)
  }
}
