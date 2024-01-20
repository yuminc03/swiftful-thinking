//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/11/26.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
  
  @StateObject private var vm = HomeVM()
  
  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
  }
  
  var body: some Scene {
    WindowGroup {
      ZStack {
        NavigationView {
          HomeView()
            .navigationBarHidden(true)
        }
        .environmentObject(vm)
        LaunchView()
      }
    }
  }
}
