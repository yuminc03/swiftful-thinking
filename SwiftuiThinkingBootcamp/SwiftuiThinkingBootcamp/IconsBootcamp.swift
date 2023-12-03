//
//  IconsBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/18.
//

import SwiftUI

struct IconsBootcamp: View {
    var body: some View {
//        Image(systemName: "heart.fill") //systemName을 입력하여 시스템 아이콘을 추가
//        Image(systemName: "paperplane.fill")
//        Image(systemName: "xmark")
        Image(systemName: "person.fill.badge.plus")
//            .font(.title) //아이콘 크기는 Text와 같이 font를 바꾸면 된다 시스템 아이콘의 크기가 자동으로 업데이트 됨(아이폰 시스템과 동적으로 작동해서 이 크기를 사용하는 게 좋음)
            .renderingMode(.original) // 원본으로 템플릿 모드 설정
            .font(.largeTitle)
//            .font(.system(size: 200)) // 특정크기 지정하기
//            .resizable() //자동으로 frame에 맞게 크기 업데이트하기 (종횡비를 선택할 수 있음)
//            .aspectRatio(contentMode: .fill) //종횡비에 맞게 이미지 채우기(fill = 이미지를 최대화해서 가능한 한 많은 프레임을 채움) - 프레임 밖으로 나갈 가능성 있음
//            .aspectRatio(contentMode: .fit) //이미지를 프레임에 정확히 유지하면서 이미지를 채움
//            .scaledToFit() //.aspectRatio(contentMode: .fit)과 같은 결과
//            .scaledToFill() //.aspectRatio(contentMode: .fill)과 같은 결과
//            .frame(width: 300, height: 300)
//            .clipped() //이미지가 프레임 가장자리를 넘어가지 않게 함, frame을 호출한 뒤에 호출해야함
//            .foregroundColor(Color(#colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1))) //아이콘 색깔(전경색)을 원하는 대로 바꾸기, 색상 리터럴 사용가능
            
    }
}

struct IconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IconsBootcamp()
    }
}
