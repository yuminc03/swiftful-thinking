//
//  ColorPickerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/08.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State private var backgroundColor: Color = .blue
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            // 사용자가 원하는 색을 선택해서 앱의 테마, 배경으로 사용할 수 있게 함
            // 색을 선택 후 X버튼을 누르기만 하면 됨
            ColorPicker(
                "Select a color",
                selection: $backgroundColor,
                supportsOpacity: true
            )
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .foregroundColor(.white)
            .font(.headline)
            .padding(50)
        }
    }
}

struct ColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootcamp()
    }
}
