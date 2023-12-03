//
//  BadgesBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/14.
//

import SwiftUI

struct BadgesBootcamp: View {
    
    var body: some View {
//        List {
//            Text("Hello Words!")
//                .badge(5)
//            Text("Hello Words!")
//            Text("Hello Words!")
//            Text("Hello Words!")
//        }
        TabView {
            Color.red
                .tabItem {
                    Image(systemName: "heart.fill")
                        Text("Hello")
                }
                .badge(5)

            Color.green
                .tabItem {
                    Image(systemName: "heart.fill")
                        Text("Hello")
                }

            Color.blue
                .tabItem {
                    Image(systemName: "heart.fill")
                        Text("Hello")
                }
        }
    }
}

struct BadgesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgesBootcamp()
    }
}
