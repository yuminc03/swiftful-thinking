//
//  ButtonsBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/30.
//

import SwiftUI

struct ButtonsBootcamp: View {
    
    @State var title: String = "This is my title" // title의 상태를 보고 있다, 변경 가능함을 의미함
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.title)

            Button("Press Me!") {
                // 버튼의 이벤트
                self.title = "BUTTON WAS PRESSED"
            }
            .accentColor(.pink) // 버튼의 label색 변경
//            .tint(.red) // iOS 15 +
            
            Button(action: {
                // 버튼의 이벤트
                self.title = "Button #2 was pressed"
            }, label: {
                // 어떤 종류의 view 추가가능함
                Text("Save")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            })

            Button(action: {
                self.title = "Button #3"
            }, label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)))
                    )
            })

            Button(action: {
                self.title = "Button #4"
            }, label: {
                Text("Finish".uppercased())
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.0)
                    )
            })
        }
    }
}

struct ButtonsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsBootcamp()
    }
}
