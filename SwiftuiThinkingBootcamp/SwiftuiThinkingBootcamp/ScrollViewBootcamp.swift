//
//  ScrollViewBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/27.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< 10) { index in
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack {
                            ForEach(0 ..< 20) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    })
                }
            }
        }
        //======================================
//        ScrollView(.horizontal, showsIndicators: true, content: { // showsIndicators == false 일 때 스크롤바 없어짐
//            HStack {
//                ForEach(0 ..< 50) { index in
//                    Rectangle()
//                        .fill(Color.purple)
//                        .frame(width: 300, height: 300)
//                }
//            }
//        })
    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}
