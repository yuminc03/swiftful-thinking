//
//  SearchBarView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 12/30/23.
//

import SwiftUI

struct SearchBarView: View {
  @Binding var searchText: String
  
  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .foregroundColor(.theme.secondaryText)
      TextField("Search by name or symbol ...", text: $searchText)
        .foregroundColor(searchText.isEmpty ? .theme.secondaryText : .theme.accent)
        .overlay(alignment: .trailing) {
          Image(systemName: "xmark.circle.fill")
            .padding()
            .offset(x: 10)
            .foregroundColor(.theme.accent)
            .opacity(searchText.isEmpty ? 0.0 : 1.0)
            .onTapGesture {
              searchText = ""
            }
        }
    }
    .font(.headline)
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 25)
        .fill(Color.theme.background)
        .shadow(color: .theme.accent.opacity(0.15), radius: 10, x: 0, y: 0)
    )
    .padding()
  }
}

struct SearchBarView_Preview: PreviewProvider {
  static var previews: some View {
    Group {
      SearchBarView(searchText: .constant(""))
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
      
      SearchBarView(searchText: .constant(""))
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.dark)
    }
  }
}
