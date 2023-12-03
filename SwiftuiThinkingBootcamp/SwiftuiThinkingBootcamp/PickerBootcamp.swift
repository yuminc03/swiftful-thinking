//
//  PickerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/08.
//

import SwiftUI

struct PickerBootcamp: View {
    
//    @State private var selection: String = "1"
    @State private var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red // segmentedControl에서 선택된 항목 색깔 바꾸기
        // 다른 segmentedControl도 모두 같은 모양이 될 것이다
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        Picker(selection: $selection, label: Text("Picker"), content: {
            ForEach(filterOptions.indices, content: { index in
                Text(filterOptions[index])
                    .tag(filterOptions[index])
            })
        })
        .pickerStyle(SegmentedPickerStyle()) // 앱에서 2~3개 사이의 옵션이 있을 때 자주 사용함 (남/녀 선택 등..)
//        .background(Color.red)
        
        //===============================================
        
//        Picker(
//            selection: $selection,
//            label:
//                HStack {
//                    Text("Filter:")
//                    Text(selection)
//                }
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .padding(.horizontal)
//                .background(Color.blue)
//                .cornerRadius(10)
//                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
//            ,
//            content: {
//                ForEach(filterOptions, id: \.self, content: { option in
//                    HStack {
//                        Text(option)
//                        Image(systemName: "heart.fill")
//                    }
//                    .tag(option)
//                })
//            }
//        )
//        .pickerStyle(MenuPickerStyle())
        
        //===============================================
        
//        VStack {
//            HStack {
//                Text("Age:")
//                Text(selection)
//            }
//
//            // picker는 사용자가 다음 중 선택해야하는 상황에서 유용함
//            Picker(
//                selection: $selection,
//                label: Text("Picker"),
//                content: {
////                    Text("1").tag("1")
////                    Text("2").tag("2")
////                    Text("3").tag("3")
////                    Text("4").tag("4")
////                    Text("5").tag("5")
//                    //=======================
//                    ForEach(18 ..< 100, content: { number in
//                        Text("\(number)")
//                            .font(.headline)
//                            .foregroundColor(.blue)
//                            .tag("\(number)")
//                    })
//            })
//            .background(Color.gray.opacity(0.3))
//            .pickerStyle(.wheel) // picker 스타일 선택가능함
//        }
    }
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
