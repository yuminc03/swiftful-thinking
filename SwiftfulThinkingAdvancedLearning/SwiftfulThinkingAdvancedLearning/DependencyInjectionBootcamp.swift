//
//  DependencyInjectionBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Yumin Chu on 2/20/24.
//

import SwiftUI
import Combine

// Problems of singleton
// 1. Singleton's are global. (앱 어느 곳에서나 접근 가능함)
// 2. Can't customize the init! (init에서 특정 값을 받지 못함)
// 3. Can't swap out dependencies.

struct PostsModel: Identifiable, Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

final class ProductionDataService {
  let url: URL
  
  init(url: URL) {
    self.url = url
  }
  
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
  let dataService: ProductionDataService
  
  init(dataService: ProductionDataService) {
    self.dataService = dataService
    loadPosts()
  }
  
  private func loadPosts() {
    dataService.getData()
      .sink { _ in
        
      } receiveValue: { [weak self] in
        self?.dataArray = $0
      }
      .store(in: &cancelBag)
  }
}

struct DependencyInjectionBootcamp: View {
  @StateObject private var vm: DependencyInjectionVM
  
  init(dataService: ProductionDataService) {
    self._vm = StateObject(wrappedValue: .init(dataService: dataService))
  }
  
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

struct DependencyInjectionBootcamp_Previews: PreviewProvider {
  static let dataService = ProductionDataService(
    url: URL(string: "https://jsonplaceholder.typicode.com/posts")!
  )
  
  static var previews: some View {
    DependencyInjectionBootcamp(dataService: dataService)
  }
}
