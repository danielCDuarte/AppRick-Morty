//
//  AppRick_MortyApp.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 8/06/25.
//

import SwiftUI

@main
struct AppRick_MortyApp: App {
    let factory = Factory(baseUrl: DataConstants.baseUrl)
    
    var body: some Scene {
        WindowGroup {
            SearchCharacterView<SearchCharacterViewModel>()
        }
    }
}
