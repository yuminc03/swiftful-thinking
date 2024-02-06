//
//  AppTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/6/24.
//

import SwiftUI

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

struct AppTabBarView: View {
  @State private var selection = "home"
  
  var body: some View {
    TabView(selection: $selection) {
      Color.red
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }
      Color.blue
        .tabItem {
          Image(systemName: "heart")
          Text("Favorites")
        }
      Color.orange
        .tabItem {
          Image(systemName: "person")
          Text("Profile")
        }
    }
  }
}

#Preview {
  AppTabBarView()
}
