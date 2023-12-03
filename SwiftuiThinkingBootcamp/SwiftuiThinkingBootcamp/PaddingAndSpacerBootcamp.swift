//
//  PaddingAndSpacerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/26.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        Text("Hello, World!")
//            .frame(width: 300, height: 100)
            .background(Color.yellow)
            .padding(.all, 10) // longger version: 원하는 패딩의 양을 줄 수 있음
            .padding([.leading, .trailing], 20) // 왼쪽에만 패딩을 20만큼 더 추가함
//            .padding() //텍스트 네 가장자리에 약간의 추가 공간을 추가함
        // padding은 동적이기 때문에 자동으로 업데이트 됨
            .background(Color.blue)
        // 프레임이 고정된 상태에서 텍스트가 길어지면 텍스트는 자동 줄바꿈 됨
        
        //======================================
        
//        Text("Save me!")
//            .font(.largeTitle)
//            .fontWeight(.semibold)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.blue)
//            .padding(.leading, 20)
        
        //=====================================
        
//        VStack(alignment: .leading) {
//            Text("Save me!")
//                .font(.largeTitle)
//                .fontWeight(.semibold)
//                .padding(.bottom, 20)
//
//            Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge.")
////                .multilineTextAlignment(.leading)
//        }
////        .background(Color.red)
//        .padding()
//        .padding(30)
//        .background(
//            Color.white
//                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y:  10))
//        .padding() // 패딩을 사용하면 앱에서 정확한 프레임을 하드코칭하는 것을 방지할 수 있다
////        .padding(.horizontal, 10)
////        .background(Color.green)
    }
}

struct PaddingAndSpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingAndSpacerBootcamp()
    }
}
