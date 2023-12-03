//
//  GridBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/27.
//

import SwiftUI

struct GridBootcamp: View {
    
    let column: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: .center),
        GridItem(.flexible(), spacing: 6, alignment: .center),
        GridItem(.flexible(), spacing: 6, alignment: .center)
//        GridItem(.adaptive(minimum: 50), spacing: nil, alignment: .center),
//        GridItem(.adaptive(minimum: 150), spacing: nil, alignment: .center)
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil)
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(100), spacing: nil, alignment: nil),
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
//        GridItem(.fixed(50), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 400)
            
            LazyVGrid(
                columns: column,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders] // sectionHeaders를 상단에 고정
            ) {
                Section(header:
                     Text("Section 1")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue)
                    .padding()
                ) {
                    ForEach(0 ..< 21) { _ in
                        Rectangle()
                            .frame(height: 150)
                    }
                }
                
                Section(header:
                     Text("Section 2")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray)
                    .padding()
                ) {
                    ForEach(0 ..< 21) { index in
                        Rectangle()
                            .fill(.blue)
                            .frame(height: 150)
                    }
                }
            }
        }
    }
}

struct GridBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GridBootcamp()
    }
}
