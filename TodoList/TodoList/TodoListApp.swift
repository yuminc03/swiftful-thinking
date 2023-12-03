//
//  TodoListApp.swift
//  TodoList
//
//  Created by Yumin Chu on 2023/05/15.
//

import SwiftUI

// MVVM Architecture
// Medel - data point
// View - UI
// ViewModel - manages Models for View

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
