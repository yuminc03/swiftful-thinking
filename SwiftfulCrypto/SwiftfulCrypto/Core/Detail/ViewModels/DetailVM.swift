//
//  DetailVM.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/18/24.
//

import Foundation
import Combine

final class DetailVM: ObservableObject {
  private let coinDetailService: CoinDetailDataService
  private var cancelBag = Set<AnyCancellable>()
  
  init(coin: CoinModel) {
    self.coinDetailService = .init(coin: coin)
    self.addSubscribers()
  }
  
  private func addSubscribers() {
    coinDetailService.$coinDetails
      .sink { coinDetails in
        print("Recieved coin detail data")
        print(coinDetails)
      }
      .store(in: &cancelBag)
  }
}
