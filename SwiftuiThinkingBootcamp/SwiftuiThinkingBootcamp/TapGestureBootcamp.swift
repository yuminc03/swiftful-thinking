//
//  TapGestureBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/09.
//

import SwiftUI

struct TapGestureBootcamp: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? Color.green : Color.purple)
            
            Button(action: {
                isSelected.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
            })
            
            Text("Tap Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
//                .onTapGesture { // 버튼을 탭할 때 작동
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2, perform: { // 작동을 위해 탭해야하는 휫수: 2
                    isSelected.toggle()
                })
            
            // 버튼은 클릭하면 강조 표시 상태를 볼 수 있음, 사용자가 누를 때 클릭되고 있다는 알림을 받을 수 있음
            // 탭제스처는 강조 표시 되지 않음
            // 버튼 코드가 더 읽기 쉬움
            
            Spacer()
        }
        .padding(40)
    }
}

struct TapGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureBootcamp()
    }
}
