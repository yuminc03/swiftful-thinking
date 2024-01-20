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
  @State private var showLaunchView = true
  
  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    UITableView.appearance().backgroundColor = .clear
  }
  
  var body: some Scene {
    WindowGroup {
      ZStack {
        NavigationStack {
          HomeView()
            .navigationBarHidden(true)
        }
        .environmentObject(vm)
        ZStack {
          if showLaunchView {
            LaunchView(showLaunchView: $showLaunchView)
              .transition(.move(edge: .leading))
          }
        }
        .zIndex(2.0)
      }
    }
  }
}
