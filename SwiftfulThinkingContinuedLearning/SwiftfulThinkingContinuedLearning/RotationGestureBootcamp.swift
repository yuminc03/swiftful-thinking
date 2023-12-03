//
//  RotationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/05/29.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State private var angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotationGesture()
                    .onChanged { value in
//                        print("changed value: \(value)")
                        angle = value
                    }
                    .onEnded { value in
                        withAnimation(.easeInOut) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

struct RotationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureBootcamp()
    }
}
