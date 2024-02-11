//
//  AppNavBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/11/24.
//

import SwiftUI

struct AppNavBarView: View {
  var body: some View {
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

#Preview {
  AppNavBarView()
}
