//
//  CustomTabBarContainerView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/7/24.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
  @Binding var selection: TabBarItem
  let content: Content
  @State private var tabs = [TabBarItem]()
  
  init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
    self._selection = selection
    self.content = content()
  }
  
  var body: some View {
    VStack(spacing: 0) {
      ZStack {
        content
      }
      CustomTabBarView(tabs: tabs, selection: $selection)
    }
  }
}

struct CustomTabBarContainerView_Previews: PreviewProvider {
  static let tabs: [TabBarItem] = [
    .init(iconName: "house", title: "Home", color: .red),
    .init(iconName: "heart", title: "Favorites", color: .blue),
    .init(iconName: "person", title: "Profile", color: .green)
  ]
  
  static var previews: some View {
    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
      Color.purple
    }
  }
}
