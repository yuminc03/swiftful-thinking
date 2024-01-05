//
//  HomeVM.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/12/08.
//

import Foundation
import Combine

class HomeVM: ObservableObject {
  /// 통계 데이터
  @Published var statistics: [StatisticModel] = [
    .init(title: "Title", value: "Value", percentageChange: 1),
    .init(title: "Title", value: "Value"),
    .init(title: "Title", value: "Value"),
    .init(title: "Title", value: "Value", percentageChange: -7)
  ]
  @Published var allCoins = [CoinModel]()
  @Published var portfolioCoins = [CoinModel]()
  @Published var searchText = ""
  
  private let coinDataService = CoinDataService()
  private let marketDataService = MarketDataService()
  private var cancelBag = Set<AnyCancellable>()
  
  init() {
    addSubscriber()
  }
  
  func addSubscriber() {
    coinDataService.$allCoins
      .sink { [weak self] coins in
        self?.allCoins = coins
      }
      .store(in: &cancelBag)
    
    marketDataService.$marketData
      .map(mapGlobalMarketData)
      .sink { [weak self] stats in
        self?.statistics = stats
      }
      .store(in: &cancelBag)
    
    // updates allCoins
    $searchText
      .combineLatest(coinDataService.$allCoins)
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .map(filterCoins)
      .sink { [weak self] coins in
        self?.allCoins = coins
      }
      .store(in: &cancelBag)
  }
  
  private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
    guard text.isEmpty == false else { return coins }
    
    let lowercasedText = text.lowercased()
    return coins.filter { coin -> Bool in
      return coin.name.lowercased().contains(lowercasedText)
      || coin.symbol.lowercased().contains(lowercasedText)
      || coin.id.lowercased().contains(lowercasedText)
    }
  }
  
  private func mapGlobalMarketData(data: MarketDataModel?) -> [StatisticModel] {
    var stats = [StatisticModel]()
    guard let data else { return stats }
    
    let marketCap = StatisticModel(
      title: "Market Cap",
      value: data.marketCap,
      percentageChange: data.marketCapChangePercentage24HUsd
    )
    let volume = StatisticModel(title: "24h Volume", value: data.volume)
    let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
    let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
    stats.append(contentsOf: [
      marketCap,
      volume,
      btcDominance,
      portfolio
    ])
    return stats
  }
}
