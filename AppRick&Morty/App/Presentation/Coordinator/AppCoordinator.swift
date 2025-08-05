//
//  AppCoordinator.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 5/08/25.
//

import SwiftUI
import Resolver

class AppCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()
    private let dependencyManager = DependencyManager.shared
    
    init() {
        print("🚀 AppCoordinator initialized")
    }
    
    func start() {
        navigateTo(.searchCharacter)
    }
    
    func navigateTo(_ destination: CoordinatorDestination) {
        dependencyManager.registerModuleDependencies(for: destination.module)
        navigationPath.append(destination)
        print("🧭 Navigating to: \(destination.module.rawValue)")
    }
    
    func navigateBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func popToRoot() {
        navigationPath = NavigationPath()
    }
    
    func createSearchCharacterListModule() -> SearchCharacterView<SearchCharacterViewModel> {
        dependencyManager.registerModuleDependencies(for: .searchCharacter)
        return SearchCharacterView<SearchCharacterViewModel>()
    }
    
    func createDetailCharacterModule(character: CharacterObject) -> DetailCharacterView<DetailCharacterViewModel> {
        dependencyManager.registerModuleDependencies(for: .characterDetail)
        return DetailCharacterView<DetailCharacterViewModel>(character: character)
    }
}
