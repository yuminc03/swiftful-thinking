//
//  AnimatableDataBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 1/31/24.
//

import SwiftUI

struct AnimatableDataBootcamp: View {
  @State private var animate = false
  
  var body: some View {
    ZStack {
      Pacman(offsetAmount: animate ? 20 : 0)
        .frame(width: 250, height: 250)
    }
    .onAppear {
      withAnimation(.easeInOut.repeatForever()) {
        animate.toggle()
      }
    }
  }
}

#Preview {
  AnimatableDataBootcamp()
}

struct RectangleWithSingleCornerAnimation: Shape {
  var cornerRadius: CGFloat
  var animatableData: CGFloat {
    get { cornerRadius }
    set { cornerRadius = newValue }
  }

  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .zero)
      path.addLine(to: .init(x: rect.maxX, y: rect.minY))
      path.addLine(to: .init(x: rect.maxX, y: rect.maxY - cornerRadius))
      
      path.addArc(
        center: .init(
          x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
        radius: cornerRadius,
        startAngle: .init(degrees: 0),
        endAngle: .init(degrees: 360),
        clockwise: false
      )
      path.addLine(to: .init(x: rect.maxX - cornerRadius, y: rect.maxY))
      path.addLine(to: .init(x: rect.minX, y: rect.maxY))
    }
  }
}

struct Pacman: Shape {
  var offsetAmount: Double
  var animatableData: Double {
    get { offsetAmount }
    set { offsetAmount = newValue }
  }
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .init(x: rect.midX, y: rect.minY))
      path.addArc(
        center: .init(x: rect.midX, y: rect.minY),
        radius: rect.height / 2,
        startAngle: .init(degrees: offsetAmount),
        endAngle: .init(degrees: 360 - offsetAmount),
        clockwise: false
      )
    }
  }
}
