//
//  CustomNavBarPreferenceKeys.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/12/24.
//

import Foundation
import SwiftUI

struct CustomNavBarTitlePreferenceKeys: PreferenceKey {
  static var defaultValue = ""
  
  static func reduce(value: inout String, nextValue: () -> String) {
    value = nextValue()
  }
}

struct CustomNavBarSubtitlePreferenceKeys: PreferenceKey {
  static var defaultValue: String?
  
  static func reduce(value: inout String?, nextValue: () -> String?) {
    value = nextValue()
  }
}

struct CustomNavBarBackButtonHiddenPreferenceKeys: PreferenceKey {
  static var defaultValue = false
  
  static func reduce(value: inout Bool, nextValue: () -> Bool) {
    value = nextValue()
  }
}

extension View {
  func customNavigationTitle(_ title: String) -> some View {
    preference(key: CustomNavBarTitlePreferenceKeys.self, value: title)
  }
  
  func customNavigationSubtitle(_ subtitle: String?) -> some View {
    preference(key: CustomNavBarSubtitlePreferenceKeys.self, value: subtitle)
  }
  
  func customNavigationBarBackButtonHidden(_ hidden: Bool) -> some View {
    preference(key: CustomNavBarBackButtonHiddenPreferenceKeys.self, value: hidden)
  }
  
  func customNavBarItems(
    title: String = "",
    subtitle: String? = nil,
    backButtonHidden: Bool = false
  ) -> some View {
    self
      .customNavigationTitle(title)
      .customNavigationSubtitle(subtitle)
      .customNavigationBarBackButtonHidden(backButtonHidden)
  }
}
