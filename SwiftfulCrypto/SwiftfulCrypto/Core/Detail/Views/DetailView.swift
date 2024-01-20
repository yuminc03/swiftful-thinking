//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/15/24.
//

import SwiftUI

struct DetailView: View {
  @StateObject private var vm: DetailVM
  private let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  private let spacing: CGFloat = 30
  
  init(coin: CoinModel) {
    self._vm = StateObject(wrappedValue: DetailVM(coin: coin))
  }
  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("test")
          .frame(height: 150)
        overviewTitleText
        Divider()
        overviewGrid
        additionalTitleText
        Divider()
        additionalGrid
      }
    }
    .navigationTitle(vm.coin.name)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DetailView(coin: dev.coin)
    }
  }
}

struct DetailLoadingView: View {
  @Binding private var coin: CoinModel?
  
  init(coin: Binding<CoinModel?>) {
    self._coin = coin
  }
  
  var body: some View {
    ZStack {
      if let coin {
        DetailView(coin: coin)
      }
    }
  }
}

extension DetailView {
  private var overviewTitleText: some View {
    Text("Overview")
      .font(.title)
      .bold()
      .foregroundColor(.theme.accent)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var overviewGrid: some View {
    LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
      ForEach(vm.overviewStatistics) {
        StatisticView(stat: $0)
      }
    }
  }
  
  private var additionalTitleText: some View {
    Text("Additional Details")
      .font(.title)
      .bold()
      .foregroundColor(.theme.accent)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var additionalGrid: some View {
    LazyVGrid(columns: columns, alignment: .leading, spacing: spacing) {
      ForEach(vm.additionalStatistics) {
        StatisticView(stat: $0)
      }
    }
  }
}
