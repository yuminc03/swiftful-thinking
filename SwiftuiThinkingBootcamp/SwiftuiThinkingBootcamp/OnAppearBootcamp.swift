//
//  OnAppearBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/09.
//

import SwiftUI

struct OnAppearBootcamp: View {
    
    @State private var myText: String = "Start text"
    @State private var count: Int = 0
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack { // 필요한 만큼의 항목 생성
                    ForEach(0 ..< 50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear { // 각 사각형에 이미지를 보여주어야 할 때 유용함 (특정항목이 화면에 나타날 때만 보여주기)
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: { // view가 초기화 된 후 화면에 그려지면 실행됨
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) { // 5초 후 업데이트
                    myText = "This is the new Text"
                }
            })
            .onDisappear(perform: { // view가 화면을 떠날 때만 호출됨
                myText = "Ending Text."
            })
            .navigationTitle("On Appear \(count)")
        }
    }
}

struct OnAppearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearBootcamp()
    }
}
