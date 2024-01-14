//
//  HomeVM.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/12/08.
//

import Foundation
import Combine

class HomeVM: ObservableObject {
  enum SortOption {
    case rank
    case rankReversed
    case holdings
    case holdingsReversed
    case price
    case priceReversed
  }
  /// 통계 데이터
  @Published var statistics = [StatisticModel]()
  @Published var allCoins = [CoinModel]()
  @Published var portfolioCoins = [CoinModel]()
  @Published var isLoading = false
  @Published var searchText = ""
  @Published var sortOption = SortOption.holdings
  
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
      .combineLatest(coinDataService.$allCoins, $sortOption)
      .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
      .map(filterAndSortCoins)
      .sink { [weak self] coins in
        self?.allCoins = coins
      }
      .store(in: &cancelBag)
    
    // updates portfolioCoins
    $allCoins
      .combineLatest(portfolioDataService.$savedEntities)
      .map(mapAllCoinsToPortfolioCoins)
      .sink { [weak self] coins in
        guard let self else { return }
        portfolioCoins = sortProtfolioCoinsIfNeeded(coins: coins)
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
  
  private func filterAndSortCoins(text: String, coins: [CoinModel], sort: SortOption) -> [CoinModel] {
    var updatedCoins = filterCoins(text: text, coins: coins)
    sortCoins(sort: sort, coins: &updatedCoins)
    return updatedCoins
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
  
  private func sortCoins(sort: SortOption, coins: inout [CoinModel]) {
    switch sort {
    case .rank, .holdings:
      coins.sort(by: { $0.rank < $1.rank })
      
    case .rankReversed, .holdingsReversed:
      coins.sort(by: { $0.rank > $1.rank })
      
    case .price:
      coins.sort(by: { $0.currentPrice > $1.currentPrice })
      
    case .priceReversed:
      coins.sort(by: { $0.currentPrice < $1.currentPrice })
    }
  }
  
  private func sortProtfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel] {
    // will only sort by holdings or reversedholdings if needed
    switch sortOption {
    case .holdings:
      return coins.sorted(by: { $0.currentHoldingsValue > $1.currentHoldingsValue })
      
    case .holdingsReversed:
      return coins.sorted(by: { $0.currentHoldingsValue < $1.currentHoldingsValue })
      
    default:
      return coins
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
