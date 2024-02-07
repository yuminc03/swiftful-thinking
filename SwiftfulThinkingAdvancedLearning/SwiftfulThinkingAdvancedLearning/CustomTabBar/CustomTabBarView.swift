//
//  CustomTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/6/24.
//

import SwiftUI

struct CustomTabBarView: View {
  let tabs: [TabBarItem]
  @Binding var selection: TabBarItem
  
  var body: some View {
    HStack {
      ForEach(tabs, id: \.self) { tab in
        tabView(tab: tab)
          .onTapGesture {
            switchToTab(tab: tab)
          }
      }
    }
    .padding(6)
    .background(Color.white.ignoresSafeArea(edges: .bottom))
  }
}

struct CustomTabBarView_Previews: PreviewProvider {
  static let tabs: [TabBarItem] = [
    .init(iconName: "house", title: "Home", color: .red),
    .init(iconName: "heart", title: "Favorites", color: .blue),
    .init(iconName: "person", title: "Profile", color: .green)
  ]
  
  static var previews: some View {
    VStack {
      Spacer()
      CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
    }
  }
}

extension CustomTabBarView {
  private func tabView(tab: TabBarItem) -> some View {
    VStack {
      Image(systemName: tab.iconName)
        .font(.subheadline)
      Text(tab.title)
        .font(.system(size: 10, weight: .semibold, design: .rounded))
    }
    .foregroundColor(selection == tab ? tab.color : .gray)
    .padding(.vertical, 8)
    .frame(maxWidth: .infinity)
    .background(selection == tab ? tab.color.opacity(0.2) : .clear)
    .cornerRadius(10)
  }
  
  private func switchToTab(tab: TabBarItem) {
    withAnimation(.easeInOut) {
      selection = tab
    }
  }
}

struct TabBarItem: Hashable {
  let iconName: String
  let title: String
  let color: Color
}
