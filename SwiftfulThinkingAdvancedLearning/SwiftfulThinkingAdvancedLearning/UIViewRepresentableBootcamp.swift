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
      Text(text)
      HStack {
        Text("SwiftUI:")
        TextField("Type here...", text: $text)
          .frame(height: 55)
          .background(Color.gray)
      }
      
      HStack {
        Text("UIKit:")
        UITextFieldViewReporesentable(
          text: $text,
          placeholder: "New placeholder",
          placeholderColor: .systemBlue
        )
        .frame(height: 55)
        .background(Color.gray)
      }
      
      HStack {
        Text("UIKit:")
        UITextFieldViewReporesentable(text: $text)
          .updatePlaceholder("New placeholder text")
          .frame(height: 55)
          .background(Color.gray)
      }
    }
  }
}

#Preview {
  UIViewRepresentableBootcamp()
}

struct UITextFieldViewReporesentable: UIViewRepresentable {
  @Binding var text: String
  var placeholder: String
  let placeholderColor: UIColor
  
  init(
    text: Binding<String>,
    placeholder: String = "Default placeholder...",
    placeholderColor: UIColor = .red
  ) {
    self._text = text
    self.placeholder = placeholder
    self.placeholderColor = placeholderColor
  }
  
  func makeUIView(context: Context) -> UITextField {
    let v = getTextField()
    v.delegate = context.coordinator
    return v
  }
  
  // from SwiftUI to UIKit
  func updateUIView(_ uiView: UITextField, context: Context) {
    uiView.text = text
  }
  
  private func getTextField() -> UITextField {
    let v = UITextField(frame: .zero)
    let placeholder = NSAttributedString(
      string: placeholder,
      attributes: [.foregroundColor: placeholderColor]
    )
    v.attributedPlaceholder = placeholder
    return v
  }
  
  func updatePlaceholder(_ text: String) -> UITextFieldViewReporesentable {
    var representedView = self
    representedView.placeholder = text
    return representedView
  }
  
  // form UIKit to SwiftUI
  func makeCoordinator() -> Coordinator {
    return Coordinator(text: $text)
  }
  
  final class Coordinator: NSObject, UITextFieldDelegate {
    @Binding var text: String
    
    init(text: Binding<String>) {
      self._text = text
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
      text = textField.text ?? ""
    }
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
