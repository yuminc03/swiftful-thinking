//
//  PopoverBottcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/02.
//

// sheets
// animations
// transitions

import SwiftUI

struct PopoverBootcamp: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                Button("BUTTON") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                Spacer()
            }
//            // METHOD 1 - Sheet
//            .sheet(isPresented: $showNewScreen, content: {
//                NewScreen()
//            })
            
            // METHOD 2 - Transition
            // 아주 역동적임
            // 두 번째 화면에서 처리함
            ZStack {
                if showNewScreen {
                    NewScreen(showNewScreen: $showNewScreen)
                        .padding(.top, 100)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                }
            }
            .zIndex(2.0)
            
//            // METHOD 3 - Animation Offset
//            NewScreen(showNewScreen: $showNewScreen)
//                .padding(.top, 100)
//                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
//                .animation(.spring())
        }
    }
}

struct NewScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .ignoresSafeArea()
            
            Button(action: {
//                presentationMode.wrappedValue.dismiss()
                showNewScreen.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

struct PopoverBottcamp_Previews: PreviewProvider {
    static var previews: some View {
        PopoverBootcamp()
        //        NewScreen()
    }
}
