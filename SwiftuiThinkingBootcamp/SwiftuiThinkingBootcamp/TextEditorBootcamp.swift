//
//  TextEditorBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/06.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State private var textEditorText: String = "This is starting text ..."
    @State private var savedText: String = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250) // textEditor는 여러줄을 추가할 때 유용하지만 custom이 조금 어렵다 그래서 사용자가 첫 번째 줄만 볼 수 있게 하려면 textField를 사용해야함
//                    .background(Color.red) // 작동 안 함
                    .foregroundColor(.blue)
//                    .colorMultiply(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)))
//                    .colorMultiply(.blue)
                    .colorMultiply(.brown)
//                    .colorMultiply(.red)
//                    .colorMultiply(.green)
                    .cornerRadius(10)
//                    .multilineTextAlignment(.center)
                
                Button(action: {
                    savedText = textEditorText
                }, label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(20)
                })
                
                Text(savedText)
                
                Spacer()
            }
            .padding()
            .background(Color.yellow)
            .navigationTitle("TextEditor Bootcamp")
        }
    }
}

struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}
