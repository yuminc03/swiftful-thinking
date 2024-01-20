//
//  SettingsView.swift
//  SwiftfulCrypto
//
//  Created by Yumin Chu on 1/20/24.
//

import SwiftUI

struct SettingsView: View {
  private let defaultURL = URL(string: "https://www.google.com")!
  private let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
  private let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
  private let coingeckoURL = URL(string: "https:/www.coingecko.com")!
  private let personalURL = URL(string: "https://www.nicksarno.com")!
  
  var body: some View {
    NavigationView {
      List {
        swiftfulThinkingSection
        coinGeckoSection
        developerSection
        applicationSection
      }
      .font(.headline)
      .tint(.blue)
      .listStyle(.grouped)
      .navigationTitle("Settings")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          XMarkButton()
        }
      }
    }
  }
}

#Preview {
  SettingsView()
}

extension SettingsView {
  private var swiftfulThinkingSection: some View {
    Section {
      VStack(alignment: .leading) {
        Image("logo")
          .resizable()
          .frame(width: 100, height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Text(
          "This app was made by following a @SwiftfulThinking course on YouTube. It uses MVVM Architecture, Combine, and CoreData!"
        )
        .font(.callout)
        .fontWeight(.medium)
        .foregroundColor(.theme.accent)
      }
      .padding(.vertical)
      Link("Subscribe on Youtube 🥳", destination: youtubeURL)
      Link("Support his coffee addiction ☕️", destination: coffeeURL)
    } header: {
      Text("Swiftful Thinking")
    }
  }
  
  private var coinGeckoSection: some View {
    Section {
      VStack(alignment: .leading) {
        Image("coingecko")
          .resizable()
          .scaledToFit()
          .frame(height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Text(
          "The cryptocurrency data that is used in this app comes form a free API from CoinGecko! Orices may be slightly delayed."
        )
        .font(.callout)
        .fontWeight(.medium)
        .foregroundColor(.theme.accent)
      }
      .padding(.vertical)
      Link("Visit CoinGecko 🦎", destination: coingeckoURL)
    } header: {
      Text("CoinGecko")
    }
  }
  
  private var developerSection: some View {
    Section {
      VStack(alignment: .leading) {
        Image("logo")
          .resizable()
          .frame(width: 100, height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Text(
          "This app was developed by Nick Sarno. It useds SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persisance."
        )
        .font(.callout)
        .fontWeight(.medium)
        .foregroundColor(.theme.accent)
      }
      .padding(.vertical)
      Link("Visit Website 🤙", destination: personalURL)
    } header: {
      Text("Developer")
    }
  }
  
  private var applicationSection: some View {
    Section {
      Link("Terms of Service", destination: defaultURL)
      Link("Privacy Policy", destination: defaultURL)
      Link("Company Websites", destination: defaultURL)
      Link("Learn More", destination: defaultURL)
    } header: {
      Text("Application")
    }
  }
}
