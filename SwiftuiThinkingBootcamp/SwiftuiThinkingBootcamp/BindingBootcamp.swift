//
//  BindingBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/01.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var backgroundColor: Color = .green
    @State var title: String = "TITLE"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ButtonView: View {
    
    @Binding var backgroundColor: Color // 상위 변수와 동일한 이름을 지정하는 구조가 일반적임
    // 상위 view에서 선언된 @State 변수에 연결하는 일을 실제로 하고 있음
    @State var buttonColor: Color = .blue
    @Binding var title: String
    
    var body: some View {
        Button(action: {
            backgroundColor = Color.orange
            buttonColor = .red
            title = "NEW TITLE"
        }, label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        })
    }
}

struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}
