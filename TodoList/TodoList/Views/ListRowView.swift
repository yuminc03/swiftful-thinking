//
//  ListRowView.swift
//  TodoList
//
//  Created by Yumin Chu on 2023/05/15.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical , 4)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "First Item!", isCompleted: false)
    static var item2 = ItemModel(title: "Second Item!", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
//        NavigationView {
//            ListRowView(title: "This is the FirstTitle")
//        }
    }
}
