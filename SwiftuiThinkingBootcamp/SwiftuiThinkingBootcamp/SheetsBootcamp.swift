//
//  SheetsBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/01.
//

import SwiftUI

struct SheetsBootcamp: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            })
            .fullScreenCover(isPresented: $showSheet, content: {
                // do not add conditional logic
                SecondScreen()
            }) // 계층당 하나만 사용할 수 있으며 fullScreenCover 또는 sheet 하나만 사용가능함, 전체화면을 덮는 형태, 위아래로 슬라이드할 수 없음
//            .sheet(isPresented: $showSheet, content: {
//                // content 클로저안에 if {} else {} 같은 조건부 논리를 사용하지 않아야 한다 대신 파라미터를 변경하는 방법이 더 좋은 방법이다
//                SecondScreen()
//            }) // view 계층 구조에서 한 번만 사용할 수 있어, view당 하나의 sheet를 유지해야한다
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var mode
    @Environment(\.isPresented) var isPresented
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.blue
                .ignoresSafeArea()
            
            Button(action: {
//                mode.wrappedValue.dismiss() // sheet를 닫을 때 사용하는 방법
                if isPresented {
                    dismiss()
                }
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

struct SheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SheetsBootcamp()
//        SecondScreen()
    }
}
