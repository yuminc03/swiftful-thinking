//
//  Date+.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/20/24.
//

import Foundation

extension Date {
  // "2023-12-03T05:36:28.501Z"
  init(coinGeckoString: String) {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    let date = formatter.date(from: coinGeckoString) ?? Date()
    self.init(timeInterval: 0, since: date)
  }
  
  private var shortFormatter: DateFormatter {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
  }
  
  func asShortDateString() -> String {
    return shortFormatter.string(from: self)
  }
}
