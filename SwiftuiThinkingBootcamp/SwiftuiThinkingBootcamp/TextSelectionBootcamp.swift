//
//  TextSelectionBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/14.
//

import SwiftUI

struct TextSelectionBootcamp: View {
    var body: some View {
        Text("Hello, World!")
            .textSelection(.enabled) // 텍스트를 길게 누르면 텍스트 선택 가능함
    }
}

struct TextSelectionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectionBootcamp()
    }
}
