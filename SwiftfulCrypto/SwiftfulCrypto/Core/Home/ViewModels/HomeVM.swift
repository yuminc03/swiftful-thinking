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
  }
}
