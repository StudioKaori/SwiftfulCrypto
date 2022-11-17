//
//  CoinRowView.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-17.
//

import SwiftUI

struct CoinRowView: View {
  
  let coin: CoinModel
  
    var body: some View {
      HStack(spacing: 0) {
        Text("\(coin.rank)")
          .font(.caption)
          .foregroundColor(Color.theme.secondaryText)
          .frame(minWidth: 30)
        Circle()
          .frame(width: 30, height: 30)
        Text(coin.symbol.uppercased())
          .font(.headline)
          .padding(.leading, 6)
          .foregroundColor(Color.theme.accent)
        Spacer()
        VStack(alignment: .trailing) {
          Text("\(coin.currentPrice.asCurrencyWithDecimals())")
            .bold()
            .foregroundColor(Color.theme.accent)
          Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
            .foregroundColor(
              (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red
            )
        }
      }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
      CoinRowView(coin: dev.coin)
    }
}
