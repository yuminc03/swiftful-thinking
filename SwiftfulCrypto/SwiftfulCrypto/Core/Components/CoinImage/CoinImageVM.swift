//
//  CoinImageVM.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 12/29/23.
//

import Foundation
import SwiftUI
import Combine

final class CoinImageVM: ObservableObject {
  @Published var image: UIImage?
  @Published var isLoading = false
  private let coin: CoinModel
  private let dataService: CoinImageService
  private var cancelBag = Set<AnyCancellable>()
  
  init(coin: CoinModel) {
    self.coin = coin
    self.dataService = .init(coin: coin)
    self.addSubscribers()
    self.isLoading = true
  }
  
  private func addSubscribers() {
    dataService.$image
      .sink { [weak self] _ in
        self?.isLoading = false
      } receiveValue: { [weak self] image in
        self?.image = image
      }
      .store(in: &cancelBag)
  }
}
