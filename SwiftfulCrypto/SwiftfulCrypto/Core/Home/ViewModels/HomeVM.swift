//
//  HomeVM.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/12/08.
//

import Foundation

class HomeVM: ObservableObject {
  @Published var allCoins = [CoinModel]()
  @Published var portfolioCoins = [CoinModel]()
  
  init() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.allCoins.append(DeveloperPreview.shared.coin)
    }
  }
}
