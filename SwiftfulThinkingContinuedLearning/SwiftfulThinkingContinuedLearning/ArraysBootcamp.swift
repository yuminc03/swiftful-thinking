//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/05/29.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let point: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        // sort
//        filteredArray = dataArray.sorted { (user1, user2) -> Bool in
//            return user1.point > user2.point
//        }
//        filteredArray = dataArray.sorted(by: { $0.point < $1.point })
        
        // filter
//        filteredArray = dataArray.filter { user -> Bool in
//            return user.isVerified
//        }
//        filteredArray = dataArray.filter { $0.isVerified }
        
        // map
//        mappedArray = dataArray.map { user -> String in
//            return user.name ?? "ERROR"
//        }
//        mappedArray = dataArray.map { $0.name }
//        mappedArray = dataArray.compactMap { user -> String? in
//            return user.name
//        }
//        mappedArray = dataArray.compactMap { $0.name }
        
        let sort = dataArray.sorted { $0.point > $1.point }
        let filter = dataArray.filter { $0.isVerified }
        let map = dataArray.compactMap { $0.name }
        
        mappedArray = dataArray
            .sorted(by: { $0.point > $1.point })
            .filter { $0.isVerified }
            .compactMap { $0.name }
        
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Yumin", point: 5, isVerified: true)
        let user2 = UserModel(name: "Chris", point: 1, isVerified: false)
        let user3 = UserModel(name: nil, point: 2, isVerified: false)
        let user4 = UserModel(name: "Emily", point: 6, isVerified: true)
        let user5 = UserModel(name: "Jason", point: 7, isVerified: false)
        let user6 = UserModel(name: "Samantha", point: 10, isVerified: true)
        let user7 = UserModel(name: nil, point: 13, isVerified: false)
        let user8 = UserModel(name: "Sarah", point: 11, isVerified: true)
        let user9 = UserModel(name: "Steve", point: 7, isVerified: false)
        let user10 = UserModel(name: "Amanda", point: 9, isVerified: true)
        dataArray.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5,
            user6,
            user7,
            user8,
            user9,
            user10
        ])
    }
}

struct ArraysBootcamp: View {
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(vm.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
//                ForEach(vm.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name)
//                            .font(.headline)
//                        HStack {
//                            Text("Points: \(user.point)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}
