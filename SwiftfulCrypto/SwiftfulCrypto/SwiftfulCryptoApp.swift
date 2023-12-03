//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/11/26.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        HomeView()
          .navigationBarHidden(true)
      }
    }
  }
}
