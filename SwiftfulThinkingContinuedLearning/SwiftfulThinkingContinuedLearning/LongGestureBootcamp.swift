//
//  LongGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/05/29.
//

import SwiftUI

struct LongGestureBootcamp: View {
    
    @State private var isComplete: Bool = false
    @State private var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("Click Here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50, perform: {
                        // at the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }) { isPressing in
                        // start of press -> min duration
                        print("isPressing: \(isPressing)")
                        if isPressing { // 누르고 있을 때
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else { // 누르고 있지 않을 때
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            })
                        }
                    }
                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
        //====================================
        
//        Text(isComplete ? "Completed" : "not Completed")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
//            .onLongPressGesture(minimumDuration: 3.0, maximumDistance: 50) {
//                isComplete.toggle()
//            } // maximumDistance: 지정한 숫자 point 내에서 클릭한 상태를 유지해야 작동함
////            .onTapGesture {
////                isComplete.toggle()
////            }
    }
}

struct LongGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongGestureBootcamp()
    }
}
