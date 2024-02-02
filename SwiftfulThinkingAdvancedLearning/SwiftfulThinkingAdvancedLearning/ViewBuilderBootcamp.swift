//
//  ViewBuilderBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/2/24.
//

import SwiftUI

struct ViewBuilderBootcamp: View {
  var body: some View {
    VStack {
      HeaderViewRegular(title: "New Title", description: "Hello")
      HeaderViewRegular(title: "Another Title", description: nil)
      Spacer()
    }
  }
}

#Preview {
  ViewBuilderBootcamp()
}

struct HeaderViewRegular: View {
  let title: String
  let description: String?
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.semibold)
      if let description {
        Text(description)
          .font(.callout)
      }
      RoundedRectangle(cornerRadius: 2)
        .frame(height: 2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
  }
}
