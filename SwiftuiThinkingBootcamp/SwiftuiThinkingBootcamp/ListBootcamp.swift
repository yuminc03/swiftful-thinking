//
//  ListBootcamp.swift
//  SwiftuiThinkingBootcamp
//
//  Created by Yumin Chu on 2023/05/02.
//

import SwiftUI

struct ListBootcamp: View {

    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    @State var veggies: [String] = [
        "carrot", "tomato", "cabbage"
    ]
    
    var body: some View {
        NavigationView {
            List {
                // 데이터 순서대로 배치
                // list에서 가장 강력한 기능은 목록에서 항목 이동, 삭제하는 기능일 것이다.
                
    //            Text("Hello, World!")
    //            Text("Hello, World!")
    //            Text("Hello, World!")
                // ===================================
                
                //section으로 그룹화 가능함
                Section(
                    header:
                        HStack {
                            Text("Fruits")
                            Image(systemName: "flame.fill")
                        }
                        .font(.headline)
                        .foregroundColor(.pink)
                ) {
                    ForEach(fruits, id: \.self) { fruit in // \.self == id
                        Text(fruit.capitalized)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.vertical)
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .background(Color.orange)
                    }
    //                .onDelete(perform: { indexSet in //동적 View의 삭제 작업 설정
    //                    delete(indexSet: indexSet)
    //                })
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.orange)
                }
                
                Section(header: Text("Veggies")) {
                    ForEach(veggies, id: \.self) { veggie in
                        Text(veggie.capitalized) // 첫글자를 대문자로 표시
                    }
                }
            }
            .accentColor(.purple)
//            // iOS, iPad의 스타일이 서로 다를 수 있어 테스트를 해야함
//            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Grocery List")
            .navigationBarItems(
                leading: EditButton(),
                trailing: addButton
            )
        }
        .accentColor(.purple) // view의 강조 색상 변경
    }
    
    private var addButton: some View {
        Button("Add", action: {
            add()
        })
    }
    
    private func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    private func move(indexSet: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indexSet, toOffset: newOffset)
    }
    
    private func add() {
        fruits.append("StrewBerry")
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
