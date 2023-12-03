//
//  AnimationTimingBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/01.
//

import SwiftUI

struct AnimationTimingBootcamp: View {
    
    @State var isAnimating: Bool = false
    let timing: Double = 5.0
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(.linear(duration: timing)) // 처음 ~ 끝까지 같은 속도
//                .animation(.spring()) //화면 팝업 표시같이 가장 일반적인 애니메이션 중 하나
                .animation(
                    .spring(
                        response: 0.5,
                        dampingFraction: 0.7,
                        blendDuration: 0.5
                    ) // response = 응답이 몇 초동안 일어날지, dampingFraction = 바운스백이 얼마나 일어날지, blendDuration = 애니메이션 지연시간
                )
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(.easeIn(duration: timing)) // 처음에 느리게 시작하고 마지막에 빠르게
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(.easeInOut(duration: timing)) // 느리다가 빠르게, 다시 느리게
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50, height: 100)
//                .animation(.easeOut(duration: timing)) // 빠르게 진행하다 느리게 진행
        }
    }
}

struct AnimationTimingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingBootcamp()
    }
}
