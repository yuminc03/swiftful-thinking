//
//  CustomNavBarContainerView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/12/24.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
  let content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    VStack(spacing: 0) {
      CustomNavBarView()
      content
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

#Preview {
  CustomNavBarContainerView {
    ZStack {
      Color.green
        .ignoresSafeArea()
      Text("Hello, World!")
        .foregroundColor(.white)
    }
  }
}
