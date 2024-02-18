//
//  UIViewControllerRepresentableBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/17/24.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
  @State private var showScreen = false
  
  var body: some View {
    VStack {
      Text("Hi")
      
      Button {
        showScreen.toggle()
      } label: {
        Text("Click here")
      }
    }
    .sheet(isPresented: $showScreen) {
      BasicUIViewRepresentable()
    }
  } 
}

#Preview {
  UIViewControllerRepresentableBootcamp()
}

struct BasicUIViewControllerRepresentable: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> some UIViewController {
    let vc = UIViewController()
    vc.view.backgroundColor = .blue
    return vc
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
}

final class MyFirstVC: UIViewController {
  
  var labelText = "Starting Value"
  
  private let label: UILabel = {
    let v = UILabel()
    v.text = "Hello, World!"
    v.textColor = .white
    return v
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBlue
    view.addSubview(label)
    
    label.frame = view.frame
  }
  
}
