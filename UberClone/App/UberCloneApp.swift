//
//  UberCloneApp.swift
//  UberClone
//
//  Created by Fahad Sheikh on 2024-01-20.
//

import SwiftUI


@main
struct UberCloneApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
