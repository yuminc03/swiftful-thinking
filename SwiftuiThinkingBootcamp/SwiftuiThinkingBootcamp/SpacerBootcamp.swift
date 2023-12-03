//
//  SpacerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/27.
//

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                
                Image(systemName: "xmark")
                
                Spacer()
//                    .frame(height: 10)
//                    .background(Color.orange)
                
                Image(systemName: "gear")
//                Spacer(minLength: nil) // nil이면 괄호만 사용해서 작성하는 것과 같음
    //            // 스페이셔가 최소 길이를 갖는 것과 상관없이 어떤 이유로 HStack이 너무 많이 압축되는 경우를 10으로 함
    //                .frame(height: 10)
    //                .background(Color.orange)
    //
    //            Rectangle()
    //                .frame(width: 50, height: 50)
    //
    //            Spacer()
    //                .frame(height: 10)
    //                .background(Color.orange)
    ////            Spacer() // frame안에서 가능한 한 크게 크기를 조정함
    ////                .frame(height: 10)
    ////                .background(Color.orange)
    //            // 개체를 왼쪽, 오른쪽으로 밀어냄
    //
    //            Rectangle()
    //                .fill(Color.red)
    //                .frame(width: 50, height: 50)
    //
    //            Spacer()
    //                .frame(height: 10)
    //                .background(Color.orange)
    //
    //            Rectangle()
    //                .fill(Color.green)
    //                .frame(width: 50, height: 50)
    //
    //            Spacer()
    //                .frame(height: 10)
    //                .background(Color.orange)
            }
            .font(.title)
//            .background(Color.yellow)
            .padding(.horizontal)
//            .background(Color.blue)
        
            Spacer()
//                .frame(width: 10)
//                .background(Color.orange)
            
            Rectangle()
                .frame(height: 55)
        }
//        .background(Color.yellow)
    }
}

struct SpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootcamp()
    }
}
