//
//  SubmitTextFieldBootenc.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/14.
//

import SwiftUI

struct SubmitTextFieldBootenc: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            TextField("Placeholder...", text: $text)
                .submitLabel(.route)
                .onSubmit {
                    print("Something to the console!")
                } // 키보드 모양 사용자 정의
            
            TextField("Placeholder...", text: $text)
                .submitLabel(.next)
                .onSubmit {
                    print("Something to the console!")
                }
            
            TextField("Placeholder...", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print("Something to the console!")
                }
        }
    }
}

struct SubmitTextFieldBootenc_Previews: PreviewProvider {
    static var previews: some View {
        SubmitTextFieldBootenc()
    }
}
