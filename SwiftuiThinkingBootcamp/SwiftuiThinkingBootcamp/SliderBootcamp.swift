//
//  SliderBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/09.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State private var sliderValue: Double = 3
    @State private var color: Color = .red
    
    var body: some View {
        
        VStack {
            Text("Rating:")
            Text(
                String(format: "%.0f", sliderValue)
            )
//            Text("\(sliderValue)")
            Slider(value: $sliderValue, in: 1 ... 10, step: 1.0, onEditingChanged: { editing in
                print(editing)
                color = .gray
            }, minimumValueLabel:
                Text("1")
                .font(.title)
                .foregroundColor(Color.blue),
            maximumValueLabel: Text("10"),
            label: {
                Text("Title")
            })
            //=====================================
//            Slider(value: $sliderValue, in: 1 ... 5, step: 1.0) // 1씩 움직이는 슬라이더
            
            //=====================================
//            Slider(value: $sliderValue, in: 0 ... 5)
//                .accentColor(.purple)
            
            //=====================================
//            Slider(value: $sliderValue)
//                .accentColor(.purple)
        }
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}
