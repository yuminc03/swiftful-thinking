//
//  GeometryPreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/5/24.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
  @State private var rectangleSize: CGSize = .zero
  
  var body: some View {
    VStack {
      Text("Hello, world!")
        .frame(width: rectangleSize.width, height: rectangleSize.height)
        .background(Color.blue)
      Spacer()
      HStack {
        GeometryReader { geometry in
          Rectangle()
            .updateRectangleGeoSize(geometry.size)
            .overlay {
              Text("\(geometry.size.width)")
                .foregroundColor(.white)
            }
        }
        Rectangle()
        Rectangle()
      }
      .frame(height: 55)
    }
    .onPreferenceChange(RectangleGeometrySizePreferenceKey.self) { value in
      self.rectangleSize = value
    }
  }
}

extension View {
  func updateRectangleGeoSize(_ size: CGSize) -> some View {
    preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
  }
}

#Preview {
  GeometryPreferenceKeyBootcamp()
}

struct RectangleGeometrySizePreferenceKey: PreferenceKey {
  static var defaultValue = CGSize.zero
  
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
    value = nextValue()
  }
}
