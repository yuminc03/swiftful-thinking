//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Yumin Chu on 2023/05/30.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
