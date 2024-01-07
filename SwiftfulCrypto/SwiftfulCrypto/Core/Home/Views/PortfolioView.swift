//
//  PortfolioView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/6/24.
//

import SwiftUI

struct PortfolioView: View {
  @EnvironmentObject private var vm: HomeVM
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading, spacing: 0) {
          SearchBarView(searchText: $vm.searchText)
          ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack(spacing: 10) {
              ForEach(vm.allCoins) { coin in
                Text(coin.symbol.uppercased())
              }
            }
          }
        }
      }
      .navigationTitle("Edit Portfolio")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          XMarkButton()
        }
      }
    }
  }
}

struct ProtfolioView_Previews: PreviewProvider {
  static var previews: some View {
    PortfolioView()
      .environmentObject(dev.homeVM)
  }
}
