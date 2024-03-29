//
//  CustomCurvesBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 1/29/24.
//

import SwiftUI

struct CustomCurvesBootcamp: View {
  var body: some View {
    WaterShape()
      .fill(
        .linearGradient(
          .init(colors: [.white, .blue]),
          startPoint: .topLeading, endPoint: .bottomTrailing
        )
      )
      .ignoresSafeArea()
  }
}

#Preview {
  CustomCurvesBootcamp()
}

struct ArcSample: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .init(x: rect.maxX, y: rect.midY))
      path.addArc(
        center: .init(x: rect.midX, y: rect.midY),
        radius: rect.height / 2,
        startAngle: .init(degrees: 0),
        endAngle: .init(degrees: 40),
        clockwise: true
      )
    }
  }
}


struct ShapeWithArc: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      // top left
      path.move(to: .init(x: rect.minX, y: rect.minY))
      
      // top right
      path.addLine(to: .init(x: rect.maxX, y: rect.minY))
      
      // mid right
      path.addLine(to: .init(x: rect.maxX, y: rect.midY))
      
      // bottom
      path.addArc(
        center: .init(x: rect.midX, y: rect.midY),
        radius: rect.height / 2,
        startAngle: .init(degrees: 0),
        endAngle: .init(degrees: 180),
        clockwise: false
      )
//      path.addLine(to: .init(x: rect.midX, y: rect.maxY))
      
      // mid left
      path.addLine(to: .init(x: rect.minX, y: rect.midY))
    }
  }
}

struct QuadSample: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .zero)
      path.addQuadCurve(
        to: .init(x: rect.midX, y: rect.midY),
        control: .init(x: rect.maxX - 50, y: rect.minY - 100)
      )
    }
  }
}

struct WaterShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .init(x: rect.minX, y: rect.midY))
      path.addQuadCurve(
        to: .init(x: rect.midX, y: rect.midY),
        control: .init(
          x: rect.width * 0.25,
          y: rect.height * 0.4
        )
      )
      path.addQuadCurve(
        to: .init(x: rect.maxX, y: rect.midY),
        control: .init(
          x: rect.width * 0.75,
          y: rect.height * 0.6
        )
      )
      path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
      path.addLine(to: .init(x: rect.minX, y: rect.maxY))
    }
  }
}
