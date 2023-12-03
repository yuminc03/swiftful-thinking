//
//  FrameBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/18.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        // 배경과 프레임을 쌓을 수 있다는 사실을 알 수 있음
        Text("Hello, world!")
            .background(Color.red)
        //모든 단일 요소가 텍스트든, 이미지든 모든 요소들은 프레임이 있고 우리는 그 프레임을 조작할 수 있기 때문에 아주 중요한 개념이다.
//            .frame(width: 300, height: 300, alignment: .leading) //프레임 내 콘텐츠를 center로 정렬 (frame의 content는 Text)
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center) // frame을 가능한 한 커지게 선택하고 컨텐츠를 가운데 정렬
//            .background(Color.blue) // 배경색 추가
            .frame(height: 100, alignment: .top)
            .background(Color.blue)
            .frame(width: 150)
            .background(Color.orange)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.purple)
            .frame(height: 400)
            .background(Color.green)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.yellow) // 프레임을 서로 쌓는 것을 강조함
        //프레임을 보고 그에 따라서 레이아웃을 수정할 수 있게 색상을 모두 넣으면서 연습하자
    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
//            .ignoresSafeArea()
    }
}
