//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/06/14.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()

    // Current Time
    /*
     @State var currentDate = Date()
     var dateFormatter: DateFormatter {
         let formatter = DateFormatter()
         formatter.dateStyle = .medium
         formatter.timeStyle = .medium
         return formatter
     }
     */
    
    // Countdown
    /*
     @State var count = 10
     @State var finishedText: String?
     */
    
    //Countdown & Date
    /*
     @State var timeRemaining = ""
     let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
     
     private func updateTimeRemaining() {
         let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
         let minute = remaining.minute ?? 0
         let second = remaining.second ?? 0
         timeRemaining = "\(minute) minutes, \(second) seconds"
     }
     */
    
    // Animation counter
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.yellow)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(5)
            }
            .frame(height: 200)
            .tabViewStyle(.page)
//            HStack(spacing: 15) {
//                Circle()
//                    .offset(y: count == 1 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 2 ? -20 : 0)
//                Circle()
//                    .offset(y: count == 3 ? -20 : 0)
//            }
//            .frame(width: 200)
//            .foregroundColor(.white)
            
//            Text(timeRemaining)
//                .font(.system(size: 100, weight: .semibold, design: .rounded))
//                .foregroundColor(.white)
//                .lineLimit(1)
//                .minimumScaleFactor(0.1)
        }
        .onReceive(timer) { _ in
            withAnimation(.easeIn) {
                count = count == 5 ? 0 : count + 1
//                count = count == 3 ? 0 : count + 1
            }
//            updateTimeRemaining()
//            currentDate = value
//            if count < 1 {
//                finishedText = "Wow!"
//            } else {
//                count -= 1
//            }
        }
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
