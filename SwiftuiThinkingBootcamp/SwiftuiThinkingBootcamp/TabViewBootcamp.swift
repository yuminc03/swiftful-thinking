//
//  TabViewBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/09.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State private var selectedTab: Int = 0
    
    private let icons: [String] = [
        "heart.fill",
        "globe",
        "house.fill",
        "person.fill"
    ]
    
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
            }
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.red)
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.green)
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.blue)
        }
        .background(
            RadialGradient(gradient: Gradient(colors: [Color.red, Color.blue]), center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(PageTabViewStyle())

        //=====================================
//        TabView(selection: $selectedTab) {
//            HomeView(selectedTab: $selectedTab)
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//                }
//                .tag(0)
//
//            Text("BROWSE TAB")
//                .tabItem {
//                    Image(systemName: "globe")
//                    Text("Browse")
//                }
//                .tag(1)
//
//            Text("PROFILE TAB")
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//                .tag(2)
//        }
//        .accentColor(.purple)
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button(action: {
                    
                }, label: {
                    Text("Go to profile")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(20)
                })
            }
        }
    }
}
