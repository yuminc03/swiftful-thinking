//
//  FuturesBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/25/24.
//

import SwiftUI
import Combine
import WebKit

// download with Combine
// download with @escping closure
// convert @escaping closure to Combine

final class FuturesBootcampVM: ObservableObject {
  @Published var title = "Starting title"
  private let url = URL(string: "https://www.google.com")!
  private var cancelBag = Set<AnyCancellable>()
  
  init() {
    download()
  }
  
  func download() {
//    getCombinePublisher()
    getFuturePublisher()
      .sink {
        print("completion!: \($0)")
      } receiveValue: { [weak self] in
        self?.title = $0
      }
      .store(in: &cancelBag)
    
//    getEscapingClosure { [weak self] value, error in
//      self?.title = value
//    }
  }
  
  func getCombinePublisher() -> AnyPublisher<String, URLError> {
    URLSession.shared.dataTaskPublisher(for: url)
      .timeout(1, scheduler: DispatchQueue.main)
      .map { _ in
        return "New value"
      }
      .eraseToAnyPublisher()
  }
  
  func getEscapingClosure(completion: @escaping (_ value: String, _ error: Error?) -> ()) {
    URLSession.shared.dataTask(with: url) { data, response, error in
      completion(
        "\(String(data: data ?? Data(), encoding: .utf8) ?? "")",
        error
      )
    }
    .resume()
  }
  
  func getFuturePublisher() -> Future<String, Error> {
    return Future { promise in
      self.getEscapingClosure { value, error in
        if let error {
          promise(.failure(error))
        } else {
          promise(.success(value))
        }
      }
    }
  }
  
  func doSomething(completion: @escaping (_ value: String) -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
      completion("New String")
    }
  }
  
  func doSomethingInTheFuture() -> Future<String, Never> {
    Future { promise in
      self.doSomething { value in
        promise(.success(value))
      }
    }
  }
}

struct FuturesBootcamp: View {
  @StateObject private var vm = FuturesBootcampVM()
  
  var body: some View {
    RepresentedWebView(htmlString: vm.title)
  }
}

#Preview {
  FuturesBootcamp()
}

struct RepresentedWebView: UIViewRepresentable {
  private let htmlString: String
  
  private let webView: WKWebView = {
    let script = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
    let userScript = WKUserScript(
      source: script,
      injectionTime: .atDocumentEnd,
      forMainFrameOnly: true
    )
    let config = WKWebViewConfiguration()
    let contentController = WKUserContentController()
    contentController.addUserScript(userScript)
    config.userContentController = contentController
    let v = WKWebView(frame: .zero, configuration: config)
    return v
  }()
  
  init(htmlString: String) {
    self.htmlString = htmlString
  }
  
  func makeUIView(context: Context) -> WKWebView {
    return webView
  }
  
  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(htmlString, baseURL: nil)
  }
}
