//
//  BackgroundThreadBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/06/11.
//

import SwiftUI

class BackgroundThreadVM: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func fetchData() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            let newData = self?.downloadData()
            print("check 1: \(Thread.isMainThread)")
            print("check 1: \(Thread.current)")
            
            DispatchQueue.main.async { // UI에 영향이 있는 부분
                self?.dataArray = newData ?? []
                print("check 2: \(Thread.isMainThread)")
                print("check 2: \(Thread.current)")
            }
        }
    }
    
    func downloadData() -> [String] {
        var data: [String] = []
        
        for x in 0 ..< 100 {
            data.append("\(x)")
            print(data)
        }
        return data
    }
}

struct BackgroundThreadBootcamp: View {
    
    @StateObject var vm = BackgroundThreadVM()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct BackgroundThreadBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundThreadBootcamp()
    }
}
