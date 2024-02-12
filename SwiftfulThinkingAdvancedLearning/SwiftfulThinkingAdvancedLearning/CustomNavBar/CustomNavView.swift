//
//  CustomNavView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/12/24.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
  let content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    NavigationView {
      CustomNavBarContainerView {
        content
      }
      .navigationBarHidden(true)
    }
    .navigationViewStyle(.stack)
  }
}

#Preview {
  CustomNavView {
    Color.purple
      .ignoresSafeArea()
  }
}
