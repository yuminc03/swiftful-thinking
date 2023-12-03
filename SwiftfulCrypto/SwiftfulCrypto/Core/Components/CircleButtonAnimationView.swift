//
//  CircleButtonAnimationView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/11/26.
//

import SwiftUI

struct CircleButtonAnimationView: View {
  
  @Binding var animate: Bool
  
  var body: some View {
    Circle()
      .stroke(lineWidth: 5)
      .scale(animate ? 1 : 0)
      .opacity(animate ? 0 : 1)
      .animation(
        animate ? .easeOut(duration: 1) : .none, value: animate
      )
      .onAppear {
        animate.toggle()
      }
  }
}

#Preview {
  CircleButtonAnimationView(animate: .constant(false))
    .foregroundColor(.red)
    .frame(width: 100, height: 100)
}
