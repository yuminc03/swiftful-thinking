//
//  UIViewRepresentableBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/13/24.
//

import SwiftUI

// Convert a UIView form UIKit to SwiftUI
struct UIViewRepresentableBootcamp: View {
  @State private var text = ""
  
  var body: some View {
    VStack {
      Text("Hello, World!")
      
      TextField("Type here...", text: $text)
        .frame(height: 55)
        .background(Color.gray)
      
      UITextFieldViewReporesentable()
        .frame(height: 55)
        .background(Color.gray)
    }
  }
}

#Preview {
  UIViewRepresentableBootcamp()
}

struct UITextFieldViewReporesentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    return getTextField()
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    
  }
  
  private func getTextField() -> UITextField {
    let v = UITextField(frame: .zero)
    let placeholder = NSAttributedString(
      string: "Type here...",
      attributes: [.foregroundColor: UIColor.green]
    )
    v.attributedPlaceholder = placeholder
    return v
  }
}

struct BasicUIViewRepresentable: UIViewRepresentable {
  func makeUIView(context: Context) -> some UIView {
    let v = UIView()
    v.backgroundColor = .blue
    return v
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) { }
}
