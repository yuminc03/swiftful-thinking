//
//  EnvironmentObjectBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/10.
//

import SwiftUI
 
class EnvironmentViewModel: ObservableObject { // 이 개체가 업데이트될 때 관찰 가능함
    
    @Published var dataArray: [String] = [] // 변경될 때마다 전체 개체를 푸시, 업데이트
    
    init() {
        getData()
    }
    
    func getData() {
//        self.dataArray.append("iPhone")
//        self.dataArray.append("iPad")
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
}

struct EnvironmentObjectBootcamp: View {
    
    // @StateObject -> use this on creation / init
    // @ObservedObject -> use this for sebivews
    @StateObject var viewModel = EnvironmentViewModel() // 객체를 관찰하도록 뷰에 알림
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(destination: {
                        EnvironmentDetailView(selectedItem: item)
                    }, label: {
                        Text(item)
                    })
                }
            }
            .navigationTitle("iOS Developer")
        }
        .environmentObject(viewModel) // 하위 view에서 여기 viewModel에 접근
    }
}

struct EnvironmentDetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            // background
            Color.orange.ignoresSafeArea()
            
            // foreground
            NavigationLink(
                destination: FinalView(),
                label: {
                    Text(selectedItem)
                        .font(.headline)
                        .foregroundColor(Color.orange)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(30)
                }
            )
        }
    }
}

struct FinalView: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.purple, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}

struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBootcamp()
//        EnvironmentDetailView(selectedItem: "iPhone")
//        FinalView()
    }
}
