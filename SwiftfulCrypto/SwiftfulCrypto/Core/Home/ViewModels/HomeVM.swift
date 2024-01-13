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
  @Published var statistics = [StatisticModel]()
  @Published var allCoins = [CoinModel]()
  @Published var portfolioCoins = [CoinModel]()
  @Published var isLoading = false
  @Published var searchText = ""
  
  private let coinDataService = CoinDataService()
  private let marketDataService = MarketDataService()
  private let portfolioDataService = PortfolioDataService()
  private var cancelBag = Set<AnyCancellable>()
  
  init() {
    addSubscriber()
  }
  
  func addSubscriber() {
    // updates allCoins
    $searchText
      .combineLatest(coinDataService.$allCoins)
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .map(filterCoins)
      .sink { [weak self] coins in
        self?.allCoins = coins
      }
      .store(in: &cancelBag)
    
    // updates portfolioCoins
    $allCoins
      .combineLatest(portfolioDataService.$savedEntities)
      .map(mapAllCoinsToPortfolioCoins)
      .sink { [weak self] coins in
        self?.portfolioCoins = coins
      }
      .store(in: &cancelBag)
    
    // update marketData
    marketDataService.$marketData
      .combineLatest($portfolioCoins)
      .map(mapGlobalMarketData)
      .sink { [weak self] stats in
        self?.statistics = stats
        self?.isLoading = false
      }
      .store(in: &cancelBag)
  }
  
  func updatePortfolio(coin: CoinModel, amount: Double) {
    portfolioDataService.updatePortfolio(coin: coin, amount: amount)
  }
  
  func reloadData() {
    isLoading = false
    coinDataService.getCoins()
    marketDataService.getData()
    HapticManager.notification(type: .success)
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
  
  private func mapAllCoinsToPortfolioCoins(
    allCoins: [CoinModel],
    portfolioCoins: [PortfolioEntity]
  ) -> [CoinModel] {
    allCoins
      .compactMap { coin -> CoinModel? in
        guard let entity = portfolioCoins.first(where: { $0.coinID == coin.id }) else {
          return nil
        }
        
        return coin.updateHoldings(amount: entity.amount)
      }
  }
  
  private func mapGlobalMarketData(data: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel] {
    var stats = [StatisticModel]()
    guard let data else { return stats }
    
    let marketCap = StatisticModel(
      title: "Market Cap",
      value: data.marketCap,
      percentageChange: data.marketCapChangePercentage24HUsd
    )
    let volume = StatisticModel(title: "24h Volume", value: data.volume)
    let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
    let portfolioValue = portfolioCoins.map { $0.currentHoldingsValue }.reduce(0, +)
    let previousValue = portfolioCoins
      .map { coin -> Double in
        let currentValue = coin.currentHoldingsValue
        let percentChange = coin.priceChangePercentage24H ?? 0 / 100
        let previousValue = currentValue / (1 + percentChange)
        return previousValue
        // 25% -> 25 -> 0.25
      }
      .reduce(0, +)
    let percentageChange = (portfolioValue - previousValue) / previousValue * 100
    let portfolio = StatisticModel(
      title: "Portfolio Value",
      value: portfolioValue.asCurrencyWith6Decimals(),
      percentageChange: percentageChange
    )
    stats.append(contentsOf: [
      marketCap,
      volume,
      btcDominance,
      portfolio
    ])
    return stats
  }
}
