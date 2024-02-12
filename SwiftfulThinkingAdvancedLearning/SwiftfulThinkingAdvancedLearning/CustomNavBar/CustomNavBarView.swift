//
//  CustomNavBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/11/24.
//

import SwiftUI

struct CustomNavBarView: View {
  @Environment(\.dismiss) var dismiss
  @State private var showBackButton = true
  @State private var title = "Title"
  @State private var subTitle: String? = "SubTitle"
  
  var body: some View {
    HStack {
      if showBackButton {
        backButton
      }
      Spacer()
      titleSection
      Spacer()
      if showBackButton {
        backButton
          .opacity(0)
      }
    }
    .padding()
    .tint(.white)
    .foregroundColor(.white)
    .font(.headline)
    .background(
      Color.blue
        .ignoresSafeArea(edges: .top)
    )
  }
}

#Preview {
  VStack {
    CustomNavBarView()
    Spacer()
  }
}

extension CustomNavBarView {
  private var backButton: some View {
    Button {
      dismiss()
    } label: {
      Image(systemName: "chevron.left")
    }
  }
  
  private var titleSection: some View {
    VStack(spacing: 4) {
      Text(title)
        .font(.title)
        .fontWeight(.semibold)
      if let subTitle {
        Text(subTitle)
      }
    }
  }
}
