//
//  ContentView.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 5/08/25.
//
import SwiftUI
import Resolver

struct ContentView: View {
    
    @StateObject private var coordinator: AppCoordinator
    
    init() {
        let coordinator = Resolver.resolve(AppCoordinator.self)
        self._coordinator = StateObject(wrappedValue: coordinator)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            coordinator.createSearchCharacterListModule()
                .navigationDestination(for: CoordinatorDestination.self) { destination in
                    switch destination {
                    case .searchCharacter:
                        coordinator.createSearchCharacterListModule()
                    case .characterDetail(let character):
                        coordinator.createDetailCharacterModule(character: character)
                    }
                }
        }
        .environmentObject(coordinator)
    }
}
