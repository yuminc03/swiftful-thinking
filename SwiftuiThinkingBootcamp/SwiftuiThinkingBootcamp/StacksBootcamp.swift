//
//  StacksBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/23.
//

import SwiftUI

struct StacksBootcamp: View {
    // Vstacks -> Vertical
    // Hstacks -> Horizontal
    // Zstacks -> ZIndex (back to front)
    var body: some View {
//        VStack {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//        }
        
//        VStack(alignment: .leading, spacing: 0) {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 150, height: 150)
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//        } // 기본적으로 spacing = nil로 설정됨 (8로 예상)
        // alignment = HorizontalAlignment
        
//        HStack(alignment: .bottom, spacing: 0) {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 150, height: 150)
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//        } // alignment = VerticalAlignment
        
//        ZStack(alignment: .topLeading) {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 200, height: 200)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 150, height: 150)
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//        } // zstack은 서로 앞에 있어서 spacing이 없음
        // backgournd() overlay()는 기본적으로 ZStack과 동일
        // stack안에 stack을 계속 쌓을 수 있음
        
        //========================================
//        HStack {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 100, height: 100)
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//        }
        //========================================
//        ZStack {
//            Rectangle()
//                .fill(.red)
//                .frame(width: 150, height: 150)
//            Rectangle()
//                .fill(.orange)
//                .frame(width: 130, height: 130)
//            Rectangle()
//                .fill(.green)
//                .frame(width: 100, height: 100)
//        }
        
//        ZStack(alignment: .top) {
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 350, height: 500, alignment: .center)
//
//            VStack(alignment: .leading, spacing: 20) {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 150, height: 150, alignment: .center)
//
//                Rectangle()
//                    .fill(.green)
//                    .frame(width: 100, height: 100)
//
//                HStack(alignment: .bottom) {
//                    Rectangle()
//                        .fill(.purple)
//                        .frame(width: 50, height: 50)
//
//                    Rectangle()
//                        .fill(.pink)
//                        .frame(width: 75, height: 75)
//
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(width: 25, height: 25)
//                }
//                .background(Color.white)
//            }
//            .background(Color.black)
//        }
        //========================================
//        VStack(alignment: .center, spacing: 20) {
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//
//            Text("Items in your cart")
//                .font(.caption)
//                .foregroundColor(.gray)
//        }
        
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)

                Text("1")
                    .font(.title)
                    .foregroundColor(.white)
            }

            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
            // Zstack이나 Text(), background()를 사용한 방법은 서로 결과가 같다.
        }
        
//        HStack(alignment: .center, spacing: 8) {
//            Text("item1")
//            Text("item2")
//            Text("item3")
//        }
    }
}

struct StacksBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StacksBootcamp()
    }
}
