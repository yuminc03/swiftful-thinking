//
//  AnyTransitionBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 1/24/24.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
  let rotation: Double
  
  func body(content: Content) -> some View {
    content
      .rotationEffect(Angle(degrees: rotation))
      .offset(
        x: rotation != 0 ? UIScreen.main.bounds.width : 0,
        y: rotation != 0 ? UIScreen.main.bounds.height : 0
      )
  }
}

extension AnyTransition {
  static var rotating: AnyTransition {
    return modifier(
      active: RotateViewModifier(rotation: 180),
      identity: RotateViewModifier(rotation: 0)
    )
  }
  
  static func rotating(rotation: Double) -> AnyTransition {
    return modifier(
      active: RotateViewModifier(rotation: rotation),
      identity: RotateViewModifier(rotation: 0)
    )
  }
  
  static var rotateOn: AnyTransition {
    return asymmetric(
      insertion: .rotating,
      removal: .move(edge: .leading)
    )
  }
}

struct AnyTransitionBootcamp: View {
  @State private var showRectangle = false
  
  var body: some View {
    VStack {
      Spacer()
      if showRectangle {
        RoundedRectangle(cornerRadius: 25)
          .frame(width: 250, height: 350)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .transition(.rotateOn)
      }
      Spacer()
      Text("Click Me!")
        .withDefaultButtonFormatting()
        .padding(.horizontal, 40)
        .onTapGesture {
          withAnimation(.easeInOut(duration: 5)) {
            showRectangle.toggle()
          }
        }
    }
  }
}

#Preview {
  AnyTransitionBootcamp()
}
