//
//  CustomShapesBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 1/27/24.
//

import SwiftUI

struct Triangle: Shape {
  
  func path(in rect: CGRect) -> Path {
    Path { path in
      path.move(to: .init(x: rect.midX, y: rect.minY))
      path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
      path.addLine(to: .init(x: rect.minX, y: rect.maxY))
      path.addLine(to: .init(x: rect.midX, y: rect.minY))
    }
  }
}

struct Diamond: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      let horizontalOffset: CGFloat = rect.width * 0.2
      path.move(to: .init(x: rect.midX, y: rect.minY))
      path.addLine(to: .init(x: rect.maxX - horizontalOffset, y: rect.midY))
      path.addLine(to: .init(x: rect.midX, y: rect.maxY))
      path.addLine(to: .init(x: rect.minX + horizontalOffset, y: rect.midY))
      path.addLine(to: .init(x: rect.midX, y: rect.minY))
    }
  }
}

struct Trapezoid: Shape {
  func path(in rect: CGRect) -> Path {
    Path { path in
      let horizontalOffset: CGFloat = rect.width * 0.2
      path.move(to: .init(x: rect.minX + horizontalOffset, y: rect.minY))
      path.addLine(to: .init(x: rect.maxX - horizontalOffset, y: rect.minY))
      path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
      path.addLine(to: .init(x: rect.minX, y: rect.maxY))
      path.addLine(to: .init(x: rect.minX + horizontalOffset, y: rect.minY))
    }
  }
}

struct CustomShapesBootcamp: View {
  var body: some View {
    ZStack {
      Trapezoid()
//      Diamond()
//      Image("swift")
//        .resizable()
//        .scaledToFill()
//      Triangle()
//        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [10]))
//        .foregroundColor(.blue)
//        .trim(from: 0, to: 0.5)
//        .fill(LinearGradient(
//          gradient: Gradient(colors: [.blue, .red]),
//          startPoint: .leading,
//          endPoint: .trailing
//        ))
        .frame(width: 300, height: 100)
//        .clipShape(
//          Triangle()
//            .rotation(Angle(degrees: 180))
//        )
    }
  }
}

#Preview {
  CustomShapesBootcamp()
}
