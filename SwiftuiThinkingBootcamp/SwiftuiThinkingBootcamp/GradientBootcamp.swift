//
//  GradientBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/17.
//

import SwiftUI

struct GradientBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
//        Circle()
            .fill(
//                Color.red
//                LinearGradient(
//                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))]),
//                    startPoint: .topLeading,
//                    endPoint: .bottom
//                ) //선형, 시작점과 끝점은 top에서 bottom, trailing 등으로 원하는 대로 바꿀 수 있음, 그라디언트 배열에는 원하는 만큼의 색을 넣을 수 있다는 것을 의미함.
                
                //============================================
                
                RadialGradient(
                    gradient: Gradient(
                        colors: [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]),
                    center: .center,
                    startRadius: 0,
                    endRadius: 150
                ) //방사형, 기본으로 작은 원에서 큰 원으로 이동함
//                RadialGradient(
//                    gradient: Gradient(
//                        colors: [Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))]),
//                    center: .center,
//                    startRadius: 100,
//                    endRadius: 150
//                )
                //============================================
                
//                AngularGradient(colors: [Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))], center: .leading, angle: .degrees(180 + 45)) //그라디언트의 선이 있는 부분이 아닌 그라디언트가 생기는 부분을 사용하자
                //중심점을 왼쪽 상단으로 옮겨서 그라디언트에서 선을 숨길 수 있음
                //각도를 설정해서 그라디언트 시작점을 조정
            )
            .frame(width: 300, height: 300)
    }
}

struct GradientBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientBootcamp()
    }
}
