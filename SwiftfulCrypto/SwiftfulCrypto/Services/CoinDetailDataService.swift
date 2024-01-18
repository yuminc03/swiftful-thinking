//
//  CoinDetailDataService.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/18/24.
//

import Foundation
import Combine

final class CoinDetailDataService {
  @Published var coinDetails: CoinDetailModel?
  private var coinDetailSubscription: AnyCancellable?
  let coin: CoinModel
  
  init(coin: CoinModel) {
    self.coin = coin
    getCoinDetails()
  }
  
  func getCoinDetails() {
    guard let url = URL(
      string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false"
    ) else { return }
    
    coinDetailSubscription = NetworkingManager.download(url: url)
      .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] coinDetails in
        self?.coinDetails = coinDetails
        self?.coinDetailSubscription?.cancel()
      })
  }
}
