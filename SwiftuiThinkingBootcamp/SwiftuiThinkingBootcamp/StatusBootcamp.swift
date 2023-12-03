//
//  StatusBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/30.
//

import SwiftUI

struct StatusBootcamp: View {
    
    @State var backgroundColor: Color = Color.green // 변경 가능성이 있어서 이 변수의 상태를 보도록 view에 지시함
    @State var titleText: String = "My Title"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            // background
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 20) {
                Text(titleText)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("BUTTON 1") {
                        backgroundColor = .blue
                        titleText = "BUTTON 1 was pressed"
                        count += 1
                    }
                    
                    Button("BUTTON 2") {
                        backgroundColor = .purple
                        titleText = "BUTTON 2 was pressed"
                        count -= 1
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

struct StatusBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StatusBootcamp()
    }
}
