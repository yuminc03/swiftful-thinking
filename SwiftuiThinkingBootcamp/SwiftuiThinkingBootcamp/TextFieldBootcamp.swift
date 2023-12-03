//
//  TextFieldBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/06.
//

import SwiftUI

struct TextFieldBootcamp: View {
    
    @State private var textFieldText: String = ""
    @State private var dataArray: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
//                TextField("Type something here...", value: $textFieldText, format: .name(style: .medium))
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(.blue)
                    .font(.headline)
                
                Button(action: {
                    if textIsApproprite() {
                        saveText()
                    }
                }, label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsApproprite() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.headline)
                })
                .disabled(!textIsApproprite()) // 버튼을 비활성화할지 설정
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Textfield Bootcamp")
        }
    }
    
    func textIsApproprite() -> Bool {
        // check text
        if textFieldText.count >= 3 {
            return true
        }
        return false
    }
    
    func saveText() {
        dataArray.append(textFieldText) // textfield에 binding되어 있어서 textFieldText는 사용자 입력을 가짐
        textFieldText = ""
    }
}

struct TextFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldBootcamp()
    }
}
