//
//  AppRick_MortyApp.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 8/06/25.
//

import SwiftUI

@main
struct AppRick_MortyApp: App {
    init() {
        print("🚀 Starting app initialization...")
        DependencyManager.shared.registerCoreDependencies(with: DataConstants.baseUrl)
        print("✅ App initialization completed")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
