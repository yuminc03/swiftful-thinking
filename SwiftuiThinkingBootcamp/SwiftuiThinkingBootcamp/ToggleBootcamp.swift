//
//  ToggleBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/08.
//

import SwiftUI

struct ToggleBootcamp: View {
    
    @State private var isToggleOn: Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Status:")
                Text(isToggleOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $isToggleOn, label: {
                Text("Toggle")
            })
            
            .toggleStyle(SwitchToggleStyle(tint: Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)))
            ) // toggle이 켜졌을 때 색을 바꿈
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

struct ToggleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToggleBootcamp()
    }
}
