//
//  CustomNavBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/11/24.
//

import SwiftUI

struct CustomNavBarView: View {
  @Environment(\.dismiss) var dismiss
  let showBackButton: Bool
  let title: String
  let subTitle: String?
  
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
    CustomNavBarView(showBackButton: true, title: "Title", subTitle: "Subtitle")
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

extension UINavigationController {
  open override func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = nil
  }
}
