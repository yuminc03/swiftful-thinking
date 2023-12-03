//
//  SafeAreaBootcamp'].swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/30.
//

import SwiftUI

struct SafeAreaBootcamp: View {
    var body: some View {
        //        Text("Hello, World!")
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            .background(Color.red)
        //            .edgesIgnoringSafeArea(.all) // 무시할 edge를 써서 safeArea를 무시할 수 있음
        //        // 일반적으로 safeArea는 배경색이나 배경 레이어를 위해서 무시하는 옵션을 사용함
        //=================================
        //        ZStack {
        //            // background
        //            Color.blue
        //                .edgesIgnoringSafeArea(.all)
        //
        //            // foreground
        //            VStack {
        //                Text("Hello, World!") // 실제로 이런 view를 그리면 우린 text가 safeArea 밖에 있어서 분명히 볼 수 없고 좋은 습관이 아니다.
        //                // safeArea를 무시하고 padding()등을 추가해도 디바이스마다 safeArea의 크기가 달라서 얼마의 padding을 추가해야하는지 알기 어렵다. 따라서 불편하고 효율적이지 않다.
        //                Spacer()
        //            }
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            .background(Color.purple)
        ////            .edgesIgnoringSafeArea(.all)
        //        }
        //=================================
        //        ZStack {
        //            Color.purple
        //                .edgesIgnoringSafeArea(.all)
        //            ScrollView {
        //                VStack {
        //                    Text("Title goes here")
        //                        .font(.largeTitle)
        //                        .frame(maxWidth: .infinity, alignment: .leading)
        //
        //                    ForEach(0 ..< 10) { index in
        //                        RoundedRectangle(cornerRadius: 25)
        //                            .fill(Color.white)
        //                            .frame(height: 150)
        //                            .shadow(radius: 10)
        //                            .padding(20)
        //                    }
        //                }
        //            }
        ////            .background(Color.purple)
        //        }
        //=================================
        ScrollView {
            VStack {
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ForEach(0 ..< 10) { index in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
        }
        //        .background(Color.blue)
        .background(
            Color.purple
            //                .edgesIgnoringSafeArea(.all)
                .ignoresSafeArea(.container, edges: .top) // 매개변수가 없으면 .all 과 같음 (iOS 14 +)
            
        ) // safeArea를 무시하는 것은 배경이미지나 배경색깔을 위한 것이다
        // view가 실제 콘텐츠면 safeArea내에서 유지해야한다
    }
}

struct SafeAreaBootcamp___Previews: PreviewProvider {
    static var previews: some View {
        SafeAreaBootcamp()
    }
}
