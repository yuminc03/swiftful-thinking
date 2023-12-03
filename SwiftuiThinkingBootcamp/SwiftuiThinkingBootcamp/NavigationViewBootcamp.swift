//
//  NavigationViewBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/02.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hello, World!", destination: MyOthrerScreen())
                
                Text("Hello World!")
                Text("Hello World!")
                Text("Hello World!")
            }
//            .navigationTitle("All Inboxes")
//            .navigationBarTitleDisplayMode(.inline) // 제목 표시 모드 변경
//            .navigationBarHidden(true) // navigationBar 숨기기 (true 면 숨김)
            .navigationBarItems(leading: Image(systemName: "person.fill"), trailing: Image(systemName: "gear"))
            
        }
    }
}

struct MyOthrerScreen: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
                .navigationTitle("Green Screen")
//                .navigationBarHidden(true)
            
            
            NavigationLink("Clinck here", destination: {
                Text("3rd screen!")
            })
        }
    }
}

struct NavigationViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewBootcamp()
    }
}
