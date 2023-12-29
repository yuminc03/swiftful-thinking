//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 2023/12/20.
//

import SwiftUI

struct CoinImageView: View {
  @StateObject var vm: CoinImageVM
  
  init(coin: CoinModel) {
    self._vm = StateObject(wrappedValue: .init(coin: coin))
  }
  
  var body: some View {
    ZStack {
      if let image = vm.image {
        Image(uiImage: image)
          .resizable()
          .scaledToFit()
      } else if vm.isLoading {
        ProgressView()
      } else {
        Image(systemName: "questionmark")
          .foregroundColor(.theme.secondaryText)
      }
    }
  }
}

struct CoinImageView_Preview: PreviewProvider {
  static var previews: some View {
    CoinImageView(coin: dev.coin)
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
