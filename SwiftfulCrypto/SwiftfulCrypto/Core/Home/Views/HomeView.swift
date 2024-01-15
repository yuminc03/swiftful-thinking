//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/11/26.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject private var vm: HomeVM
  /// True - 오른쪽으로 애니메이션
  @State private var showPortfolio = false
  /// True - 새로운 sheet 보여주기
  @State private var showPortfolioView = false
  
  var body: some View {
    ZStack {
      // background layer
      Color.theme.background
        .ignoresSafeArea()
        .sheet(isPresented: $showPortfolioView) {
          PortfolioView()
            .environmentObject(vm)
        }
      
      // content layer
      VStack {
        homeHeader
        HomeStatsView(showPortfolio: $showPortfolio)
        SearchBarView(searchText: $vm.searchText)
        columnTitles
        if showPortfolio == false {
          allCoinsList
            .transition(.move(edge: .leading))
        } else {
          portfolioCoinsList
            .transition(.move(edge: .trailing))
        }
        Spacer(minLength: 0)
      }
    }
  }
}

struct HomeView_Preview: PreviewProvider {
  static var previews: some View {
    NavigationView {
      HomeView()
        .navigationBarHidden(true)
    }
    .environmentObject(dev.homeVM)
  }
}

extension HomeView {
  private var homeHeader: some View {
    HStack {
      CircleButtonView(iconName: showPortfolio ? "plus" : "info")
        .animation(.none, value: showPortfolio)
        .onTapGesture {
          if showPortfolio {
            showPortfolioView.toggle()
          }
        }
        .background(
          CircleButtonAnimationView(animate: $showPortfolio)
        )
      Spacer()
      Text(showPortfolio ? "Portfolio" : "Live Prices")
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(.theme.accent)
      Spacer()
      CircleButtonView(iconName: "chevron.right")
        .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
        .onTapGesture {
          withAnimation(.spring()) {
            showPortfolio.toggle()
          }
        }
    }
    .padding(.horizontal)
  }
  
  private var allCoinsList: some View {
    List {
      ForEach(vm.allCoins) { coin in
        CoinRowView(coin: coin, showHoldingsColumn: false)
          .listRowInsets(
            .init(top: 10, leading: 0, bottom: 10, trailing: 0)
          )
      }
    }
    .listStyle(.plain)
  }
  
  private var portfolioCoinsList: some View {
    List {
      ForEach(vm.portfolioCoins) { coin in
        CoinRowView(coin: coin, showHoldingsColumn: true)
          .listRowInsets(
            .init(top: 10, leading: 0, bottom: 10, trailing: 0)
          )
      }
    }
    .listStyle(.plain)
  }
  
  private var columnTitles: some View {
    HStack {
      HStack(spacing: 4) {
        Text("Coin")
        Image(systemName: "chevron.down")
          .opacity(
            (vm.sortOption == .rank || vm.sortOption == .rankReversed) ?
            1.0 : 0.0
          )
          .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
      }
      .onTapGesture {
        withAnimation(.default) {
          vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
        }
      }
      
      Spacer()
      if showPortfolio {
        HStack(spacing: 4) {
          Text("Holdings")
          Image(systemName: "chevron.down")
            .opacity(
              (vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ?
              1.0 : 0.0
            )
            .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
        }
        .onTapGesture {
          withAnimation(.default) {
            vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed: .holdings
          }
        }
      }
      HStack(spacing: 4) {
        Text("Price")
        Image(systemName: "chevron.down")
          .opacity(
            (vm.sortOption == .price || vm.sortOption == .priceReversed) ?
            1.0 : 0.0
          )
          .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
      }
      .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
      .onTapGesture {
        withAnimation(.default) {
          vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
        }
      }
      
      Button {
        withAnimation(.linear(duration: 2)) {
          vm.reloadData()
        }
      } label: {
        Image(systemName: "goforward")
      }
      .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
    }
    .font(.caption)
    .foregroundColor(.theme.secondaryText)
    .padding(.horizontal)
  }
}
