//
//  ImageBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/18.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
//        Image("keyrings")
        Image("judy")
            .renderingMode(.template) // resizable 전에 호출해야함, 이미지를 템플릿 이미지로 만들어서 단일평면 색상을 제공. 이것은 배경이 없는 경우에만 작동함 (Asset에서 Image Set - Render as를 Templete image로 바꾸면 코드에서 지정해줄 필요 없음
            .resizable()
            .aspectRatio(contentMode: .fit)
//            .scaledToFit()
//            .scaledToFill()
        // 원 모양으로 이미지 보이기
            .frame(width: 300, height: 200)
            .foregroundColor(.purple)
//            .clipped()
//            .clipShape(Circle()) // 자동으로 이미지를 모든 모양의 크기로 자르기
//            .clipShape(Ellipse())
//            .cornerRadius(150)
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
