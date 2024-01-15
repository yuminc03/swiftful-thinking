//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/15/24.
//

import SwiftUI

struct DetailView: View {
  private let coin: CoinModel
  
  init(coin: CoinModel) {
    self.coin = coin
  }
  
  var body: some View {
    Text(coin.name)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(coin: dev.coin)
  }
}
