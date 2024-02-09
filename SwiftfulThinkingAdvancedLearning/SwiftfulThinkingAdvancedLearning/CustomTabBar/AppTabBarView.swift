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
  @State private var tabSelection: TabBarItem = .init(iconName: "house", title: "Home", color: .red)
  
  var body: some View {
    CustomTabBarContainerView(selection: $tabSelection) {
      Color.blue
        .tabBarItem(
          tab: .init(iconName: "house", title: "Home", color: .red), 
          selection: $tabSelection
        )
      Color.red
        .tabBarItem(
          tab: .init(iconName: "heart", title: "Favorites", color: .blue), 
          selection: $tabSelection
        )
      
      Color.green
        .tabBarItem(
          tab: .init(iconName: "person", title: "Profile", color: .green), 
          selection: $tabSelection
        )
    }
  }
}

#Preview {
  AppTabBarView()
}

extension AppTabBarView {
  private var defaultTabView: some View {
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
