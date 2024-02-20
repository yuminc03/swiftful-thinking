//
//  DependencyInjectionBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/20/24.
//

import SwiftUI
import Combine

struct PostsModel: Identifiable, Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

final class ProductionDataService {
  
  static let shared = ProductionDataService()
  let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
  
  private init() { }
  
  func getData() -> AnyPublisher<[PostsModel], Error> {
    URLSession.shared.dataTaskPublisher(for: url)
      .map { $0.data }
      .decode(type: [PostsModel].self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}

final class DependencyInjectionVM: ObservableObject {
  @Published var dataArray = [PostsModel]()
  private var cancelBag = Set<AnyCancellable>()
  
  init() {
    loadPosts()
  }
  
  private func loadPosts() {
    ProductionDataService.shared.getData()
      .sink { _ in
        
      } receiveValue: { [weak self] in
        self?.dataArray = $0
      }
      .store(in: &cancelBag)
  }
}

struct DependencyInjectionBootcamp: View {
  @StateObject private var vm = DependencyInjectionVM()
  
  var body: some View {
    ScrollView {
      VStack {
        ForEach(vm.dataArray) {
          Text($0.title)
        }
      }
    }
  }
}

#Preview {
  DependencyInjectionBootcamp()
}
