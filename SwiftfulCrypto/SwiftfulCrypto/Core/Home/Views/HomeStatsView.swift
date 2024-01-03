//
//  HomeStatsView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/3/24.
//

import SwiftUI

struct HomeStatsView: View {
  @EnvironmentObject private var vm: HomeVM
  @Binding var showPortfolio: Bool
  
  var body: some View {
    HStack {
      ForEach(vm.statistics) { stat in
        StatisticView(stat: stat)
          .frame(width: UIScreen.main.bounds.width / 3)
      }
    }
    .frame(
      width: UIScreen.main.bounds.width,
      alignment: showPortfolio ? .trailing : .leading
    )
  }
}

struct HomeStatsView_Previews: PreviewProvider {
  static var previews: some View {
    HomeStatsView(showPortfolio: .constant(false))
      .environmentObject(dev.homeVM)
  }
}
