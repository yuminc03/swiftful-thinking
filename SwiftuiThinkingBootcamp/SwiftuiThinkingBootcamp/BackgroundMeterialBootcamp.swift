//
//  BackgroundMeterialBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/14.
//

import SwiftUI

struct BackgroundMeterialBootcamp: View {
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 30, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
            Image("keyrings")
                .resizable()
                .scaledToFill()
        )
    }
}

struct BackgroundMeterialBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMeterialBootcamp()
    }
}
