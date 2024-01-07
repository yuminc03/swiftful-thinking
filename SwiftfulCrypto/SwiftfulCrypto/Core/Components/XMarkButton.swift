//
//  XMarkButton.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/7/24.
//

import SwiftUI

struct XMarkButton: View {
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    Button {
      dismiss()
    } label: {
      Image(systemName: "xmark")
        .font(.headline)
    }
  }
}

struct XMarkButton_Previews: PreviewProvider {
  static var previews: some View {
    XMarkButton()
      .previewLayout(.sizeThatFits)
  }
}
