//
//  StepperBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/09.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State private var stepperValue: Int = 10
    @State private var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper 2", onIncrement: {
                incrementWidth(amount: 10)
            }, onDecrement: {
                incrementWidth(amount: -10)
            })
        }
    }
    
    private func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
