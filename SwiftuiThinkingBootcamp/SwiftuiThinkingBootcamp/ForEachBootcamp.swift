//
//  ForEachBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/04/27.
//

import SwiftUI

struct ForEachBootcamp: View {
    
    let data: [String] = ["Be", "Save me", "Yet to Come"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
//            ForEach(data.indices) { index in
//                Text("\(data[index]): \(index)")
//            }
//
//            ForEach(0 ..< 100) { index in
//                Circle()
//                    .frame(height: 50)
//            }
            
            Text(myString)
            ForEach(0 ..< 10) { index in
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    Text("Index is: \(index)")
                }
////                Text("I'm Fine: \(index)")
            }
//            Text("ONE")
//            Text("TWO")
//            Text("THREE")
            
            ForEach(data, id: \.self) { str in
                Text(str)
            }
        }
    }
}

struct ForEachBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachBootcamp()
    }
}
