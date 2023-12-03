//
//  AnimationBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/01.
//

import SwiftUI

struct AnimationBootcamp: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                withAnimation(
                    .default
//                        .delay(0.8) // 애니메이션 지연함
//                        .repeatCount(5, autoreverses: true) // 애니메이션 반복 (autoreverses == true, 자동반전(양방향 애니메이션) 허용, 애니메이션을 적용하고 원래 상태로 다시 전환하려는 경우)
                        .repeatForever(autoreverses: true) // 영원히 반복

                ) {
                    isAnimated.toggle()
                } // 애니메이션 적용
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 70)
                .fill(isAnimated ? .red : .blue)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
//                .animation(
//                    .default
//                        .repeatForever(autoreverses: true)
//                )
            Spacer()
        }
    }
}

struct AnimationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootcamp()
    }
}
