//
//  String+.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/20/24.
//

import Foundation

extension String {
  var isNotEmpty: Bool {
    return self.isEmpty == false
  }
  
  var removingHTMLOccurances: String {
    return replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
  }
}
