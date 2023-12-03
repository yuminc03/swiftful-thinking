//
//  ButtonStyleBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/14.
//

import SwiftUI

struct ButtonStyleBootcamp: View {
    var body: some View {
        VStack {
            
            Button(action: {
                
            }, label: {
                Text("Button Title")
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.large)
            
            Button("Button Titlee") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .buttonStyle(.plain) // 버튼 제목만 있는 스타일
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .buttonStyle(.bordered) // 배경색은 라이트, 다크 모드에 따라 변경해주어야 함
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.small)
            
            Button("Button Title") {
                
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
//            .buttonStyle(.borderless)
            .buttonStyle(.borderedProminent)
            .controlSize(.mini)
        }
        .padding()
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
