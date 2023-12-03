//
//  TextBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/15.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, Swift World!")
//        Text("Hello, World! This is the SwiftUI Thinking Bootcamp. I am really enjoying this course and learning alot.".capitalized) //텍스트 앞글자만 대문자로 설정한 텍스트 문장
//            .font(.title)
            .font(.title2) //글꼴은 기본 텍스트, 시스템 설정에 따라 바뀔 수 있음
            .fontWeight(.semibold) //글자 굵기는 .semibold
//            .bold() //글자 굵기를 bold로 설정
//            .underline() //글자에 밑줄 추가
//            .underline(true, color: Color.red) //밑줄 사용자 지정하기, 빨간색 밑줄 추가
//            .italic() //이텔릭체로 설정
//            .strikethrough() //취소선 추가
//            .strikethrough(true, color: Color.green) //취소선 사용자 설정으로 초록색 취소선 생성
//            .font(.system(size: 24, weight: .semibold, design: .monospaced)) //font 설정 바꾸기, 단, text 크기가 고정됨
//            .baselineOffset(-50) //문단 간격 설정(기본 아래에 간격 추가)
//            .kerning(3) //텍스트간 간격을 바꿈
//            .multilineTextAlignment(.leading) //기본적으로 .center
            .foregroundColor(.blue) //텍스트 색깔
//            .frame(width: 200, height: 100, alignment: .leading) //텍스트 영역 프레임 크기 지정, 텍스트 정렬
            .frame(width: 200, height: 100, alignment: .center)
//            .minimumScaleFactor(0.5) //실제 글자 크기에서 백분율 단위로 축소
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}
