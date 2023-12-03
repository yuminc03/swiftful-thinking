//
//  ListViewModel.swift
//  TodoList
//
//  Created by LS-NOTE-00106 on 2023/05/16.
//

import Foundation

/*
 CRUD FUNCTION
 
 Create
 Read
 Update
 Delete
*/
final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemsKey: String = "items_key"
    
    init() {
        getItems()
    }
    
    private func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {
            return
        }
        
        guard let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data) else {
            return
        }
    
        self.items = savedItem
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    // view에서 직접 사용하면 AppStorage를 사용하고 class에 속해있어서 UserDefaults 사용함
    // UserDefault는 사용자 ID, 이름 처럼 작은 데이터 조각을 저장할 때 사용해야한다
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) { // json형태로 데이터 변환
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
