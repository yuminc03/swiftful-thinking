//
//  TypealiasBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/06/12.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

//struct TVModel {
//    let title: String
//    let director: String
//    let count = Int
//}
typealias TVModel = MovieModel // 기존 타입에 대해서 새 이름 설정하기

struct TypealiasBootcamp: View {
    
//    @State private var item = MovieModel(title: "Title", director: "Joe", count: 5)
    @State private var item: TVModel = TVModel(title: "TV Title", director: "Emily", count: 10)
    
    var body: some View {
        Text(item.title)
        Text(item.director)
        Text("\(item.count)")
    }
}

struct TypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TypealiasBootcamp()
    }
}
