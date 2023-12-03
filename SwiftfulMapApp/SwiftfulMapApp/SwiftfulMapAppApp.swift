//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Yumin Chu on 2023/05/21.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
