//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/11/26.
//

import SwiftUI

struct HomeView: View {
  
  @State private var showProtfolio = false
  
  var body: some View {
    ZStack {
      // background layer
      Color.theme.background
        .ignoresSafeArea()
      
      // content layer
      VStack {
        homeHeader
        Spacer(minLength: 0)
      }
    }
  }
}

#Preview {
  NavigationView {
    HomeView()
      .navigationBarHidden(true)
  }
}

extension HomeView {
  private var homeHeader: some View {
    HStack {
      CircleButtonView(iconName: showProtfolio ? "plus" : "info")
        .animation(.none, value: showProtfolio)
        .background(
          CircleButtonAnimationView(animate: $showProtfolio)
        )
      Spacer()
      Text(showProtfolio ? "Portfolio" : "Live Prices")
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(.theme.accent)
      Spacer()
      CircleButtonView(iconName: "chevron.right")
        .rotationEffect(Angle(degrees: showProtfolio ? 180 : 0))
        .onTapGesture {
          withAnimation(.spring()) {
            showProtfolio.toggle()
          }
        }
    }
    .padding(.horizontal)
  }
}
