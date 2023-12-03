//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/05/29.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - use a binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsBootcamp: View {
    
    @State private var selectedModel: RandomModel? = nil
//    @State private var showSheet: Bool = false
//    @State private var showSheet2: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0 ..< 50) { index in
                    Button("Button \(index)") {
                        selectedModel = RandomModel(title: "\(index)")
                    }
                }
    //            Button("Button 1") {
    //                selectedModel = RandomModel(title: "ONE")
    ////                showSheet.toggle()
    //            }
    ////            .sheet(isPresented: $showSheet) {
    ////                NextScreen(selectedModel: RandomModel(title: "ONE"))
    ////            }
    //
    //            Button("Button 2") {
    //                selectedModel = RandomModel(title: "TWO")
    ////                showSheet2.toggle()
    //            }
    //            .sheet(isPresented: $showSheet2) {
    //                NextScreen(selectedModel: RandomModel(title: "TWO"))
    //            }
            }
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
    }
}

struct NextScreen: View {
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsBootcamp()
    }
}
