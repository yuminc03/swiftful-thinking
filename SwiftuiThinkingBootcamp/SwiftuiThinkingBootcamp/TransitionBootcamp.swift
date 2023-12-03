//
//  TransitionBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/01.
//

import SwiftUI

struct TransitionBootcamp: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("Button") {
                    showView.toggle()
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
//                    .opacity(showView ? 1.0 : 0.0)
//                    .transition(.slide) // 왼쪽에서 오른쪽으로 이동하는 슬라이드 애니메이션
//                    .transition(.move(edge: .bottom)) // 애니메이션을 적용한 도형 하단 가장자리
//                    .transition(.opacity.animation(.easeInOut)) // 투명도에 animation을 주기
//                    .transition(.scale.animation(.easeInOut)) // 확대 및 축소하는 애니메이션
                    .transition(
//                        .asymmetric(
//                            insertion: .move(edge: .bottom),
//                            removal: .opacity.animation(.easeInOut)
//                        )
                        .asymmetric(
                            insertion: .move(edge: .bottom),
                            removal: .move(edge: .trailing) // 삽입, 제거를 추가해서 화면에 보여줄 때, 화면에서 치울 때 애니메이션을 결정가능함
                        )
                    )
                    .animation(.easeInOut) // opacity transition일 때 필요없음
//                    .animation(.spring())
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct TransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootcamp()
    }
}
