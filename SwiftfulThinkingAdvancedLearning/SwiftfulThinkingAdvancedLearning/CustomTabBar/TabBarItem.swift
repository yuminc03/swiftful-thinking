//
//  TabBarItem.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/10/24.
//

import Foundation
import SwiftUI

//struct TabBarItem: Hashable {
//  let iconName: String
//  let title: String
//  let color: Color
//}

enum TabBarItem: Hashable {
  case home
  case favorites
  case profile
  case message
  
  var iconName: String {
    switch self {
    case .home:
      return "house"
      
    case .favorites:
      return "heart"
      
    case .profile:
      return "person"
      
    case .message:
      return "message"
    }
  }
  
  var title: String {
    switch self {
    case .home:
      return "Home"
      
    case .favorites:
      return "Favorites"
      
    case .profile:
      return "Profile"
      
    case .message:
      return "Message"
    }
  }
  
  var color: Color {
    switch self {
    case .home:
      return .red
      
    case .favorites:
      return .blue
      
    case .profile:
      return .green
      
    case .message:
      return .orange
    }
  }
}
