//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/05/29.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State private var rating: Int = 2
    
    var body: some View {
        ZStack {
            starsView
                .overlay {
                    overlayView
                        .mask(starsView)
                }
        }
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red, Color.blue]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
//                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false) // 사용자가 클릭하는 것을 허용하지 않음
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1 ..< 6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
