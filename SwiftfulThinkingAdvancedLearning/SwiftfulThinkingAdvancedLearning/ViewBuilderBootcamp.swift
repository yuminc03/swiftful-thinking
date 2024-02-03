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
      HeaderViewRegular(
        title: "New Title",
        description: "Hello",
        iconName: "heart.fill"
      )
      HeaderViewRegular(
        title: "Another Title",
        description: nil,
        iconName: nil
      )
      HeaderViewGeneric(title: "Generic Title") {
        Text("Hi")
      }
      HeaderViewGeneric(title: "Generic Title") {
        VStack {
          Text("Hello")
          Image(systemName: "heart.fill")
          Text("Hello")
        }
      }
      CustomHStack {
        Text("Coffee")
        Text("Coffee")
      }
      
      Spacer()
    }
  }
}

#Preview {
  LocalViewBuilder(type: .one)
}

struct HeaderViewRegular: View {
  let title: String
  let description: String?
  let iconName: String?
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.semibold)
      if let description {
        Text(description)
          .font(.callout)
      }
      
      if let iconName {
        Image(systemName: iconName)
      }
      RoundedRectangle(cornerRadius: 2)
        .frame(height: 2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
  }
}

struct HeaderViewGeneric<Content: View>: View {
  let title: String
  let content: Content
  
  init(title: String, @ViewBuilder content: () -> Content) {
    self.title = title
    self.content = content()
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.semibold)
      
      content
      
      RoundedRectangle(cornerRadius: 2)
        .frame(height: 2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
  }
}

struct CustomHStack<Content: View>: View {
  let content: Content
  
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  var body: some View {
    HStack {
      content
    }
  }
}

struct LocalViewBuilder: View {
  enum ViewType {
    case one, two, three
  }
  let type: ViewType
  
  var body: some View {
    if type == .one {
      Text("One!")
    } else if type == .two {
      VStack {
        Text("TODO")
        Image(systemName: "heart.fill")
      }
    } else if type == .three {
      VStack {
        Text("Three!")
        Image(systemName: "heart.fill")
      }
    }
                
  }
}
