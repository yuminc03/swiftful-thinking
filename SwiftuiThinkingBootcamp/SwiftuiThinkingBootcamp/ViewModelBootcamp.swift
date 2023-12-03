//
//  ViewModelBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/09.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject { // 이 개체가 업데이트될 때 관찰 가능함
    
    @Published var fruitArray: [FruitModel] = [] // 변경될 때마다 전체 개체를 푸시, 업데이트
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    // 앱이 복잡할 수록 기능을 분리하는게 좋다
    func getFruits() {
        let orange = FruitModel(name: "Orange", count: 9)
        let banana = FruitModel(name: "Banana", count: 10)
        let watermelon = FruitModel(name: "Watermelon", count: 2)
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.fruitArray.append(orange)
            self.fruitArray.append(banana)
            self.fruitArray.append(watermelon)
            self.isLoading = false
        })
    }
    
    func deleteFruits(indexSet: IndexSet) {
        fruitArray.remove(atOffsets: indexSet)
    }
}

struct ViewModelBootcamp: View {
    
    // @StateObject - > use this on creation / init
    // @ObservedObject -> use this for sebivews
    @StateObject var viewModel = FruitViewModel() // 객체를 관찰하도록 뷰에 알림
    
    var body: some View {

        NavigationView {
            List {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(viewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.blue)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: viewModel.deleteFruits)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing: NavigationLink(destination: RandomScreen(fruitViewModel: viewModel), label: {
                Image(systemName: "arrow.right")
                    .font(.title)
            })
            )
        }
    }
}

struct RandomScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
//            Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Text("GO BACK")
//                    .foregroundColor(.white)
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//            })
        }
    }
}

struct ViewModelBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModelBootcamp()
//        RandomScreen()
    }
}
