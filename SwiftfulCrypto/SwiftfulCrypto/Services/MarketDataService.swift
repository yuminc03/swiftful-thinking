//
//  MarketDataService.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/4/24.
//

import Foundation
import Combine

final class MarketDataService {
  @Published var marketData: MarketDataModel?
  private var marketDataSubsciption: AnyCancellable?
  
  init() {
    getData()
  }
  
  func getData() {
    guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
    
    marketDataSubsciption = NetworkingManager.download(url: url)
      .decode(type: GlobalData.self, decoder: JSONDecoder())
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] globalData in
        self?.marketData = globalData.data
        self?.marketDataSubsciption?.cancel()
      })
  }
}
