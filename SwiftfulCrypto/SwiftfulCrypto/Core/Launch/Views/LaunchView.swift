//
//  LaunchView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/20/24.
//

import SwiftUI

struct LaunchView: View {
  @State private var loadingText = "Loading your portfolio...".map { String($0) }
  @State private var showLoadingText = false
  @State private var counter = 0
  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    ZStack {
      Color.launch.background
        .ignoresSafeArea()
      Image("logo-transparent")
        .resizable()
        .frame(width: 100, height: 100)
      ZStack {
        if showLoadingText {
          HStack(spacing: 0) {
            ForEach(loadingText.indices) { index in
              Text(loadingText[index])
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.launch.accent)
                .offset(y: counter == index ? -5 : 0)
            }
          }
          .transition(AnyTransition.scale.animation(.easeIn))
        }
      }
      .offset(y: 70)
    }
    .onAppear {
      showLoadingText.toggle()
    }
    .onReceive(timer) { _ in
      withAnimation(.spring()) {
        counter += 1
      }
    }
  }
}

#Preview {
  LaunchView()
}
