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

  @Published var overviewStatistics = [StatisticModel]()
  @Published var additionalStatistics = [StatisticModel]()
  @Published var coin: CoinModel
  @Published var coinDescription: String?
  @Published var websiteURL: String?
  @Published var redditURL: String?
  
  init(coin: CoinModel) {
    self.coin = coin
    self.coinDetailService = .init(coin: coin)
    self.addSubscribers()
  }
  
  private func addSubscribers() {
    coinDetailService.$coinDetails
      .combineLatest($coin)
      .map(mapDataToStatistics)
      .sink { [weak self] data in
        self?.overviewStatistics = data.overview
        self?.additionalStatistics = data.additional
      }
      .store(in: &cancelBag)
    
    coinDetailService.$coinDetails
      .sink { [weak self] coinDetails in
        self?.coinDescription = coinDetails?.readableDescription
        self?.websiteURL = coinDetails?.links?.homepage?.first
        self?.redditURL = coinDetails?.links?.subredditURL
      }
      .store(in: &cancelBag)
  }
  
  private func mapDataToStatistics(
    coinDetailModel: CoinDetailModel?, coinModel: CoinModel
  ) -> (overview: [StatisticModel], additional: [StatisticModel]) {
    let overviews = createOverviews(coinModel: coinModel)
    let additionals = createAdditionals(coinDetailModel: coinDetailModel, coinModel: coinModel)
    return (overviews, additionals)
  }
  
  private func createOverviews(coinModel: CoinModel) -> [StatisticModel] {
    // Overview
    let price = coinModel.currentPrice.asCurrencyWith6Decimals()
    let pricePercentChange = coinModel.priceChangePercentage24H
    let priceStat = StatisticModel(title: "Crrent Price", value: price, percentageChange: pricePercentChange)
    
    let marketCap = "$" + (coinModel.marketCap?.formattedWithAbbreviations() ?? "")
    let marketCapPercentChange = coinModel.marketCapChangePercentage24H
    let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapPercentChange)
    
    let rank = "\(coinModel.rank)"
    let rankStat = StatisticModel(title: "Rank", value: rank)
    
    let volume = "$" + (coinModel.totalVolume?.formattedWithAbbreviations() ?? "")
    let volumeStat = StatisticModel(title: "Volume", value: volume)
    
    return [priceStat, marketCapStat, rankStat, volumeStat]
  }
  
  private func createAdditionals(coinDetailModel: CoinDetailModel?, coinModel: CoinModel) -> [StatisticModel] {
    let high = coinModel.high24H?.asCurrencyWith6Decimals() ?? "n/a"
    let highStat = StatisticModel(title: "24h High", value: high)
    
    let low = coinModel.low24H?.asCurrencyWith6Decimals() ?? "n/a"
    let lowStat = StatisticModel(title: "24h Low", value: low)
    
    let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
    let pricePercentChange = coinModel.priceChangePercentage24H
    let priceChangeStat = StatisticModel(title: "24h price Change", value: priceChange, percentageChange: pricePercentChange)
    
    let marketCapChange = "$" + (coinModel.marketCapChange24H?.formattedWithAbbreviations() ?? "")
    let marketCapPercentChange2 = coinModel.marketCapChangePercentage24H
    let marketCapChangeStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange2)
    
    let blockTime = coinDetailModel?.blockTimeInMinutes ?? 0
    let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
    let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
    
    let hashing = coinDetailModel?.hashingAlgorithm ?? "n/a"
    let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
    
    return [highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat]
  }
}
