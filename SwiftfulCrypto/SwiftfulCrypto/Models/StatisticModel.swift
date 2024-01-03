//
//  StatisticModel.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/3/24.
//

import Foundation

struct StatisticModel: Identifiable {
  let id = UUID().uuidString
  let title: String
  let value: String
  let percentageChange: Double?
  
  init(title: String, value: String, percentageChange: Double? = nil) {
    self.title = title
    self.value = value
    self.percentageChange = percentageChange
  }
}

let newModel = StatisticModel(title: "", value: "", percentageChange: 45)
let newModel2 = StatisticModel(title: "", value: "")
