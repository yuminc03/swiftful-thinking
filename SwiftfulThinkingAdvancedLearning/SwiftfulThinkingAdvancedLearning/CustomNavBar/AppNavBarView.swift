//
//  AppNavBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/11/24.
//

import SwiftUI

struct AppNavBarView: View {
  var body: some View {
    CustomNavView {
      ZStack {
        Color.orange
          .ignoresSafeArea()
        NavigationLink {
          Text("Destination")
        } label: {
          Text("Navigate")
        }
      }
    }
  }
}

#Preview {
  AppNavBarView()
}

extension AppNavBarView {
  private var defaultNavView: some View {
    NavigationView {
      ZStack {
        Color.purple.ignoresSafeArea()
        
        NavigationLink {
          Text("Destination")
            .navigationTitle("Title 2")
            .navigationBarBackButtonHidden(false)
        } label: {
          Text("Navigate")
        }
      }
      .navigationTitle("Nav title here")
    }
  }
}
