//
//  BackgroundAndOverlayBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/23.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
//        Text("Hello world!")
//            .background(
////                Color.red
////                LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
//                Circle()
////                    .fill(.blue)
//                    .fill(
//                        LinearGradient(
//                            gradient: Gradient(colors: [Color.red, Color.blue]),
//                            startPoint: .leading,
//                            endPoint: .trailing
//                        )
//                    )
//                    .frame(width: 100, height: 100, alignment: .center)
//            ) // 다른 View(다른 화면, Text, Color, Shape..)를 넣을 수 있음
//            .background(
//                Circle()
////                    .fill(Color.red)
//                    .fill(
//                        LinearGradient(
//                            gradient: Gradient(colors: [.blue, .red]),
//                            startPoint: .leading,
//                            endPoint: .trailing
//                        )
//                    )
//                    .frame(width: 120, height: 120, alignment: .center)
//            )
        //===================================================
//        Circle()
//            .fill(.pink)
//            .frame(width: 100, height: 100)
//            .overlay(
//                Text("1")
//                    .font(.largeTitle)
//                    .foregroundColor(.white)
//            )
//            .background(
//                Circle()
//                    .foregroundColor(.purple)
//                    .frame(width: 110, height: 110)
//            )
        //===================================================
//        Rectangle()
//            .frame(width: 100, height: 100)
//            .overlay(
//                Rectangle()
//                    .fill(.blue)
//                    .frame(width: 50, height: 50)
//                , alignment: .topLeading
//            )
//            .background(
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150)
//                , alignment: .bottomTrailing
//            )
        //===================================================
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    ) // 보라색 원을 linearGradient로 채우기
                    .frame(width: 100, height: 100) //하트 뒤에 보라색 원 뷰를 추가
                    .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.5)), radius: 10, x: 0, y: 10) // 원 위에 그림자 추가
                    .overlay(
                        Circle()
                            .fill(.blue)
                            .frame(width: 35, height: 35) // 파란색 원을 추가
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.5)), radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing)
                // SwiftUI의 항목 레이어링과 stack과 관련해서 수행할 수 있는 무한한 가능성
            )
    }
}

struct BackgroundAndOverlayBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlayBootcamp()
    }
}
