//
//  ViewModifierBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 1/22/24.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
  let backgroundColor: Color
  
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .foregroundColor(.white)
      .frame(height: 55)
      .frame(maxWidth: .infinity)
      .background(backgroundColor)
      .cornerRadius(20)
      .shadow(radius: 10)
  }
}

extension View {
  func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
    return modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
  }
}

struct ViewModifierBootcamp: View {
  var body: some View {
    VStack(spacing: 20) {
      Text("Hello World!")
        .font(.headline)
        .withDefaultButtonFormatting()
      
      Text("Hello everyone!")
        .font(.subheadline)
        .withDefaultButtonFormatting(backgroundColor: .orange)
      
      Text("Hello!!")
        .font(.title)
        .withDefaultButtonFormatting(backgroundColor: .pink)
    }
    .padding()
  }
}

#Preview {
  ViewModifierBootcamp()
}
