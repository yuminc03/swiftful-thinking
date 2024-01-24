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
    return AnyTransition.modifier(
      active: RotateViewModifier(rotation: 180),
      identity: RotateViewModifier(rotation: 0)
    )
  }
  
  static func rotating(amount: Double) -> AnyTransition {
    return AnyTransition.modifier(
      active: RotateViewModifier(rotation: amount),
      identity: RotateViewModifier(rotation: 0)
    )
  }
  
  static func rotateOn() -> some View {
    VStack {
      
    }
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
          .transition(.asymmetric(insertion: .identity, removal: .scale))
//          .transition(.rotating(amount: 1000))
//          .transition(AnyTransition.rotating.animation(.easeInOut))
//          .transition(AnyTransition.scale.animation(.easeInOut))
//          .transition(.move(edge: .leading))
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
