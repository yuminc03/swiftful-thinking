//
//  HomeVM.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/12/08.
//

import Foundation
import Combine

class HomeVM: ObservableObject {
  @Published var allCoins = [CoinModel]()
  @Published var portfolioCoins = [CoinModel]()
  @Published var searchText = ""
  
  private let dataService = CoinDataService()
  private var cancelBag = Set<AnyCancellable>()
  
  init() {
    addSubscriber()
  }
  
  func addSubscriber() {
    dataService.$allCoins
      .sink { [weak self] returnedCoins in
        self?.allCoins = returnedCoins
      }
      .store(in: &cancelBag)
    
    // updates allCoins
    $searchText
      .combineLatest(dataService.$allCoins)
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
}
