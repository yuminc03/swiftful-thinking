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
  @State private var loops = 0
  @Binding private var showLaunchView: Bool
  let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
  
  init(showLaunchView: Binding<Bool>) {
    self._showLaunchView = showLaunchView
  }
  
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
            ForEach(loadingText.indices, id: \.self) { index in
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
        let lastIndex = loadingText.count - 1
        if counter == lastIndex {
          counter = 0
          loops += 1
          if loops >= 2 {
            showLaunchView = false
          }
        } else {
          counter += 1
        }
      }
    }
  }
}

#Preview {
  LaunchView(showLaunchView: .constant(true))
}
