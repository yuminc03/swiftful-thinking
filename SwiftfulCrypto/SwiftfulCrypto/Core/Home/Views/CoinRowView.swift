import SwiftUI

struct CoinRowView: View {
  
  let coin: CoinModel
  let showHoldingsColumn: Bool
  
  var body: some View {
    HStack(spacing: 0) {
      leftColumn
      Spacer()
      if showHoldingsColumn {
        centerView
      }
      rightColumn
    }
    .font(.subheadline)
    .background(Color.theme.background.opacity(0.001))
  }
}

struct CoinRowView_Preview: PreviewProvider {
  static var previews: some View {
    CoinRowView(coin: dev.coin, showHoldingsColumn: true)
      .previewLayout(.sizeThatFits)
  }
}

extension CoinRowView {
  var leftColumn: some View {
    HStack(spacing: 0) {
      Text("\(coin.rank)")
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .frame(minWidth: 30)
      CoinImageView(coin: coin)
        .frame(width: 30, height: 30)
      Text(coin.symbol.uppercased())
        .font(.headline)
        .padding(.leading, 6)
        .foregroundColor(Color.theme.accent)
    }
  }
  
  var centerView: some View {
    VStack(alignment: .trailing) {
      Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
        .bold()
      Text((coin.currentHoldings ?? 0).asNumberString())
    }
  }
  
  var rightColumn: some View {
    VStack(alignment: .trailing) {
      Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
        .bold()
        .foregroundColor(Color.theme.accent)
      Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
        .foregroundColor(
          (coin.priceChangePercentage24H ?? 0) >= 0 ?
          Color.theme.green : Color.theme.red
        )
    }
    .frame(
      width: UIScreen.main.bounds.width / 3.5,
      alignment: .trailing
    )
  }
}
