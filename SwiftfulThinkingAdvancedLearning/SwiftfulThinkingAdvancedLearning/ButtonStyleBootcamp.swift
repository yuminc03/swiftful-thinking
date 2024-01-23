//
//  ButtonStyleBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 1/23/24.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
  let scaledAmount: CGFloat
  
  init(scaledAmount: CGFloat) {
    self.scaledAmount = scaledAmount
  }
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
  }
}

struct BrightButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .brightness(configuration.isPressed ? 0.5 : 0)
  }
}

struct OpacityButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .opacity(configuration.isPressed ? 0.3 : 1.0)
  }
}

extension View {
  func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
    buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
  }
  
  func withBrightStyle() -> some View {
    buttonStyle(BrightButtonStyle())
  }
  
  func withOpacityStyle() -> some View {
    buttonStyle(OpacityButtonStyle())
  }
}

struct ButtonStyleBootcamp: View {
  var body: some View {
    VStack {
      Button {
        
      } label: {
        Text("Click me!")
          .font(.headline)
          .withDefaultButtonFormatting()
      }
      .padding(.vertical, 10)
      .buttonStyle(.plain)
      // plain: highlight 효과가 기본보다 강하지 않음
      
      Button {
        
      } label: {
        Text("Click me!")
          .font(.headline)
          .withDefaultButtonFormatting()
      }
      .padding(.vertical, 10)
      .withPressableStyle()
      
      Button {
        
      } label: {
        Text("Click me!")
          .font(.headline)
          .withDefaultButtonFormatting()
      }
      .padding(.vertical, 10)
      .withBrightStyle()
      
      Button {
        
      } label: {
        Text("Click me!")
          .font(.headline)
          .withDefaultButtonFormatting()
      }
      .padding(.vertical, 10)
      .withOpacityStyle()
    }
    .padding(.horizontal, 40)
  }
}

#Preview {
  ButtonStyleBootcamp()
}
