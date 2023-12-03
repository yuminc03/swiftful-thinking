//
//  ColorsBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/17.
//

import SwiftUI

struct ColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
//                Color.primary
//                Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)) //color literal로 색상을 변경하는 방법 - 색깔 그림이 나오고 두 번 클릭해서 색깔을 마음대로 바꿀 수 있다. 사용자 지정으로 크레용 불투명도 변경, 색상환과 슬라이더에서 16진수 색깔을 얻을 수도 있다.
//                Color(UIColor.secondarySystemBackground) //이러한 시스템 색깔 중 일부는 다크모드에서 빛과 함께 변한다. (다크 모드로 변경하면 어두운 회색으로 변함)
                Color("CustomColor")
            ) //SwiftUI의 색, primary는 라이트모드에서 기본으로 검은색, 다크 모드에서 흰색이다
            .frame(width: 300, height: 200)
//            .shadow(radius: 10) //기본적인 회색 그림자
            .shadow(color: Color("CustomColor").opacity(0.3), radius: 10, x: -20, y: -20) //사용자 지정으로 만든 custom color를 사용해서 그림자 색상을 적용
    }
}

struct ColorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorsBootcamp()
    }
}
