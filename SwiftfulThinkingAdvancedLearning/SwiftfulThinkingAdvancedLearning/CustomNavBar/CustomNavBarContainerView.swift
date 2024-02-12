//
//  CustomNavBarContainerView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/12/24.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
  let content: Content
  @State private var showBackButton = false
  @State private var title = ""
  @State private var subTitle: String?
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    VStack(spacing: 0) {
      CustomNavBarView(
        showBackButton: showBackButton,
        title: title,
        subTitle: subTitle
      )
      content
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .onPreferenceChange(CustomNavBarTitlePreferenceKeys.self) { value in
      title = value
    }
    .onPreferenceChange(CustomNavBarSubtitlePreferenceKeys.self ) { value in
      subTitle = value
    }
    .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKeys.self ) { value in
      showBackButton = !value
    }
  }
}

#Preview {
  CustomNavBarContainerView {
    ZStack {
      Color.gray
        .ignoresSafeArea()
      Text("Hello, World!")
        .foregroundColor(.white)
        .customNavigationTitle("New Title")
        .customNavigationSubtitle("Subtitle")
        .customNavigationBarBackButtonHidden(true)
    }
  }
}
