//
//  PreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/4/24.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
  @State private var text = "Hello World!"
  
  var body: some View {
    NavigationView {
      VStack {
        SecondaryScreen(text: text)
          .navigationTitle("Navigation Title")
      }
    }
    .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
      self.text = value
    }
  }
}

#Preview {
  PreferenceKeyBootcamp()
}

extension View {
  func customTitle(_ text: String) -> some View {
    self
      .preference(key: CustomTitlePreferenceKey.self, value: text)
  }
}

struct SecondaryScreen: View {
  let text: String
  @State private var newValue = ""
  
  var body: some View {
    Text(text)
      .onAppear(perform: getDataFromDatabase)
      .customTitle(newValue)
  }
  
  func getDataFromDatabase() {
    // download
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      self.newValue = "🫐New Value From Database🫐"
    }
  }
}

struct CustomTitlePreferenceKey: PreferenceKey {
  static var defaultValue = ""
  
  static func reduce(value: inout String, nextValue: () -> String) {
    value = nextValue()
  }
}
