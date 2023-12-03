//
//  DatePickerBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/08.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State private var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        
        VStack {
            Text("SELECTED DATE IS:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            DatePicker("Select a Date", selection: $selectedDate, in: startingDate ... endingDate, displayedComponents: [.date]) // displayedComponents에서 날짜만 배치할지, 시간만 배치할지 정할 수 있음 (미래 날짜 선택 불가능)
                .accentColor(Color.red) // 강조 색상 변경
                .datePickerStyle(
                    CompactDatePickerStyle()
                )
        }
        
        //===========================================
        
//        DatePicker("Selet a Date", selection: $selectedDate, displayedComponents: [.date]) // displayedComponents에서 날짜만 배치할지, 시간만 배치할지 정할 수 있음
//            .accentColor(Color.red) // 강조 색상 변경
//            .datePickerStyle(
//                CompactDatePickerStyle()
//            )
        
        //==============================================
        
//        DatePicker("Select a Date", selection: $selectedDate)
//            .accentColor(Color.red) // 강조 색상 변경
//            .datePickerStyle(
//                CompactDatePickerStyle()
////                GraphicalDatePickerStyle()
////                WheelDatePickerStyle()
//            )
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
