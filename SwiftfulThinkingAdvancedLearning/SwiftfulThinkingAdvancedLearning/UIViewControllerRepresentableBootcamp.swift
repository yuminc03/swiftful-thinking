//
//  UIViewControllerRepresentableBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/17/24.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
  @State private var showScreen = false
  @State private var image: UIImage?
  
  var body: some View {
    VStack {
      Text("Hi")
      if let image {
        Image(uiImage: image)
          .resizable()
          .scaledToFit()
          .frame(width: 200, height: 200)
      }
      
      Button {
        showScreen.toggle()
      } label: {
        Text("Click here")
      }
    }
    .sheet(isPresented: $showScreen) {
//      RepresentedBasicUIVC(labelText: "New Text")
      RepresentedUIImagePicker(image: $image, showScreen: $showScreen)
    }
  }
}

#Preview {
  UIViewControllerRepresentableBootcamp()
}

// MARK: - RepresentedUIImagePicker

struct RepresentedUIImagePicker: UIViewControllerRepresentable {
  
  @Binding var image: UIImage?
  @Binding var showScreen: Bool
  
  func makeUIViewController(context: Context) -> UIImagePickerController {
    let vc = UIImagePickerController()
    vc.allowsEditing = false
    vc.delegate = context.coordinator
    return vc
  }
  
  // from SwiftUI to UIKit
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
  
  // from UIKit to SwiftUI
  func makeCoordinator() -> Coordinator {
    return Coordinator(image: $image, showScreen: $showScreen)
  }
  
  final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding private var image: UIImage?
    @Binding private var showScreen: Bool
    
    init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
      self._image = image
      self._showScreen = showScreen
    }
    
    func imagePickerController(
      _ picker: UIImagePickerController,
      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
      guard let newImage = info[.originalImage] as? UIImage else { return }
      image = newImage
      showScreen = false
    }
  }
}

// MARK: - RepresentedBasicUIVC

struct RepresentedBasicUIVC: UIViewControllerRepresentable {
  private let labelText: String
  
  init(labelText: String) {
    self.labelText = labelText
  }
  
  func makeUIViewController(context: Context) -> some UIViewController {
    let vc = MyFirstVC()
    vc.labelText = labelText
    return vc
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

// MARK: - MyFirstVC

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
