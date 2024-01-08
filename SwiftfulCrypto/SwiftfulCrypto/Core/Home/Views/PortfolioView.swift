//
//  PortfolioView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/6/24.
//

import SwiftUI

struct PortfolioView: View {
  @EnvironmentObject private var vm: HomeVM
  @State private var selectedCoin: CoinModel?
  @State private var quantityText = ""
  @State private var showCheckmark = false
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack(alignment: .leading, spacing: 0) {
          SearchBarView(searchText: $vm.searchText)
          coinLogoList
          if selectedCoin != nil {
            portfolioInputSection
          }
        }
      }
      .navigationTitle("Edit Portfolio")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          XMarkButton()
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          trailingNavBarButtons
        }
      }
    }
  }
}

struct PortfolioView_Previews: PreviewProvider {
  static var previews: some View {
    PortfolioView()
      .environmentObject(dev.homeVM)
  }
}

extension PortfolioView {
  private var coinLogoList: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHStack(spacing: 10) {
        ForEach(vm.allCoins) { coin in
          CoinLogoView(coin: coin)
            .frame(width: 75)
            .padding(4)
            .onTapGesture {
              withAnimation(.easeIn) {
                selectedCoin = coin
              }
            }
            .background(
              RoundedRectangle(cornerRadius: 10)
                .stroke(
                  selectedCoin?.id == coin.id ?
                  Color.theme.green : Color.clear,
                  lineWidth: 1
                )
            )
        }
      }
      .frame(height: 120)
      .padding(.leading)
    }
  }
  
  private var portfolioInputSection: some View {
    VStack(spacing: 20) {
      HStack {
        Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
        Spacer()
        Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
      }
      Divider()
      HStack {
        Text("Amount holding:")
        Spacer()
        TextField("Ex. 1.4", text: $quantityText)
          .multilineTextAlignment(.trailing)
          .keyboardType(.decimalPad)
      }
      Divider()
      HStack {
        Text("Current value:")
        Spacer()
        Text(getCurrentValue().asCurrencyWith6Decimals())
      }
    }
    .animation(.none)
    .padding()
    .font(.headline)
  }
  
  private var trailingNavBarButtons: some View {
    HStack(spacing: 10) {
      Image(systemName: "checkmark")
        .opacity(showCheckmark ? 1 : 0)
      Button {
        
      } label: {
        Text("Save".uppercased())
      }
      .opacity(
        selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ? 1 : 0
      )
    }
    .font(.headline)
  }
  
  private func getCurrentValue() -> Double {
    if let quantity = Double(quantityText) {
      return quantity * (selectedCoin?.currentPrice ?? 0)
    }
    
    return 0
  }
  
  private func didTapSaveButton() {
    guard let selectedCoin else { return }
    
    // save to portfolio
    
    // show checkmark
    withAnimation(.easeIn) {
      showCheckmark = true
    }
    
    // hide keyboard
    UIApplication.shared.endEditing()
    
    // hide checkmark
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      withAnimation(.easeOut) {
        showCheckmark = false
      }
    }
  }
  
  private func removeSelectedCoin() {
    selectedCoin = nil
    vm.searchText = ""
  }
}
