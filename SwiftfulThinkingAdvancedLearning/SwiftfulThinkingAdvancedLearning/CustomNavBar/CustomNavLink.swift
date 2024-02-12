//
//  CustomNavLink.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/12/24.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
  private let destination: Destination
  private let label: Label
  
  init(destination: Destination, @ViewBuilder label: () -> Label) {
    self.destination = destination
    self.label = label()
  }
  
  var body: some View {
    NavigationLink {
      CustomNavBarContainerView {
        destination
      }
      .navigationBarHidden(true)
    } label: {
      label
    }
  }
}

#Preview {
  CustomNavView {
    CustomNavLink(destination: Text("Destination")) {
      Text("Click Me!")
    }
  }
}
