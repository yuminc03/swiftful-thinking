//
//  ShapesBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/17.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10) //둥근 직사각형 만들기 cornerRadius를 맘대로 바꿀 수 있음
            .fill(Color.pink)
//            .trim(from: 0.4, to: 1.0)
//            .fill(Color.blue)
            .frame(width: 300, height: 200) // 여기에 텍스트, 사진을 추가할 수 있는 많은 작업에서 유용함
//        Capsule(style: .continuous) //캡슐 (.circular, .continuous) 텍스트 뒤나 버튼 뒤에 넣고 싶을 때 유용함, 캡슐서 채울 수 있는 모든 수정자를 변경할 수 있음
        //==================================================
//        Capsule(style: .continuous)
//            .fill(Color.orange)
//            .stroke(Color.gray)
//            .frame(width: 230, height: 100)

        //==================================================
//        Ellipse() //타원을 추가 (타원 또한 원에서 한 것과 같이 모든 수정자를 추가할 수 있음)
//            .fill(Color.purple)
//            .stroke(Color.gray, lineWidth: 10)
//            .trim(from: 0.2, to: 1.0)
//            .frame(width: 200, height: 100) //너비, 높이를 지정해서 타원의 모양 정하기
        //==================================================
//        Circle() // 라이브러리를 사용할 필요가 없고 화면에 원을 표현함 (원은 기본 검은색)
//            .fill(Color.blue) //원을 다른 색으로 채운다
//            .stroke() //원에 윤곽선(테두리)를 그린다 (기본으로 검은색)
//            .stroke(Color.red) //원 테두리를 다른 색으로 그린다
//            .stroke(Color.blue, lineWidth: 15) //테두리 색과 테두리의 굵기 지정
//            .stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [40])) //원 색깔을 지정하고 테두리에 스타일을 추가함(테두리의 굵기, 테두리 끝 모양, dash로 할 수 있는 옵션들이 있음
//            .trim(from: 0.2, to: 1.0) //원의 일부만 표현할 수 있음(반으로 자르는 것)
//            .stroke(Color.purple, lineWidth: 20) //trim과 함께 사용하여 둥근 로딩바 모양을 만들 수 있음
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
