//
//  ContextMenuBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/03.
//

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var backgroundColor: Color = Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1))
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("SwiftUI Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(30))
        
        // 기본적으로 아이콘, 제목만 허용
        .contextMenu(menuItems: {
            Button(action: {
                backgroundColor = .gray
            }, label: {
                Label("Share post", systemImage: "flame.fill")
            })
            
            Button(action: {
                backgroundColor = .yellow
            }, label: {
                Text("Report post")
            })
            
            Button(action: {
                backgroundColor = .blue
            }, label: {
                HStack {
                    Text("Like post")
                    Image(systemName: "heart.fill")
                }
            })
        })
    }
}

struct ContextMenuBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuBootcamp()
    }
}
