//
//  ListSwipeActionsBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/14.
//

import SwiftUI

struct ListSwipeActionsBootcamp: View {
    
    @State var fruits: [String] = ["apple", "orange", "banana", "peach"]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Archive") {
                            print("Archive")
                        }
                        .tint(.green)
                        
                        Button("Save") {
                            print("Save")
                        }
                        .tint(.blue)
                        
                        Button("Junk") {
                            
                        }
                        .tint(.black)
                    } 
                
//                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
//                        Button("Share") {
//
//                        }
//                        .tint(.green)
//
//                        Button("Save") {
//
//                        }
//                        .tint(.blue)
//
//                        Button("Junk") {
//
//                        }
//                        .tint(.black)
//                    }
            }
            .onDelete(perform: delete)
        }
    }
    
    private func delete(indexSet: IndexSet) {
        
    }
}

struct ListSwipeActionsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListSwipeActionsBootcamp()
    }
}
