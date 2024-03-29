//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/15/24.
//

import SwiftUI

struct DetailView: View {
  @StateObject private var vm: DetailVM
  @State private var showFullDescription = false
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
      VStack {
        ChartView(coin: vm.coin)
          .padding(.vertical)
        VStack(spacing: 20) {
          overviewTitleText
          Divider()
          descriptionSection
          overviewGrid
          additionalTitleText
          Divider()
          additionalGrid
          websiteSection
        }
        .padding()
      }
    }
    .background(
      Color.theme.background
        .ignoresSafeArea()
    )
    .navigationTitle(vm.coin.name)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        navigationBarTrailingItems
      }
    }
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
  private var navigationBarTrailingItems: some View {
    HStack {
      Text(vm.coin.symbol.uppercased())
        .font(.headline)
        .foregroundColor(.theme.secondaryText)
      CoinImageView(coin: vm.coin)
        .frame(width: 25, height: 25)
    }
  }
  
  private var overviewTitleText: some View {
    Text("Overview")
      .font(.title)
      .bold()
      .foregroundColor(.theme.accent)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var descriptionSection: some View {
    ZStack {
      if let coinDescription = vm.coinDescription, coinDescription.isNotEmpty {
        VStack {
          Text(coinDescription)
            .lineLimit(showFullDescription ? nil : 3)
            .font(.callout)
            .foregroundColor(.theme.secondaryText)
          Button {
            withAnimation(.easeInOut) {
              showFullDescription.toggle()
            }
          } label: {
            Text(showFullDescription ?  "Less" : "Read more..")
              .font(.caption)
              .fontWeight(.bold)
              .padding(.vertical, 4)
          }
          .tint(.blue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
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
  
  private var websiteSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      if let websiteURL = vm.websiteURL,
         let url = URL(string: websiteURL)
      {
        Link("Website", destination: url)
      }
      
      if let redditString = vm.redditURL,
         let url = URL(string: redditString)
      {
        Link("Reddit", destination: url)
      }
    }
    .tint(.blue)
    .frame(maxWidth: .infinity, alignment: .leading)
    .font(.headline)
  }
}
