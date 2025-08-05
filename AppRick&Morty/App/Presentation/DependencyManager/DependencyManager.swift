//
//  DependencyManager.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 5/08/25.
//

import SwiftUI
import Resolver

class DependencyManager {
    static let shared = DependencyManager()
    private var registeredModules: Set<AppModule> = []
    
    private init() {}
    
    // MARK: - Core Dependencies (Always Available)
    func registerCoreDependencies(with baseUrl: String) {
        
        Resolver.register {
            URLSession(configuration: URLSession.configuration())
        }.scope(.application)
        
        Resolver.register {
            NetworkService(
                url: baseUrl,
                urlSession: Resolver.resolve(URLSession.self),
                decoder: JSONDecoder()
            )
        }.implements(NetworkServiceType.self).scope(.application)
        
        Resolver.register {
            GraphQLNetworkService(networkService: Resolver.resolve(NetworkServiceType.self))
        }.implements(GraphQLNetworkServiceType.self).scope(.application)
        
        Resolver.register {
            RickAndMortyGraphQLRepositories(
                graphQLNetworkService: Resolver.resolve(GraphQLNetworkServiceType.self)
            )
        }.implements(RickAndMortyGraphQLRepositoriesType.self).scope(.application)
        
        Resolver.register { AppCoordinator() as AppCoordinator }
            .scope(.application)
    }
    
    
    func registerModuleDependencies(for module: AppModule) {
        guard !registeredModules.contains(module) else { return }
        
        switch module {
        case .searchCharacter:
            registerSearchCharacterDependencies()
        case .characterDetail:
            registerCharacterDetailDependencies()
        }
        registeredModules.insert(module)
        print("📦 Registered dependencies for module: \(module.rawValue)")
    }
    
    
    private func registerSearchCharacterDependencies() {
        Resolver.register {
            GetCharactersUseCase(repository: Resolver.resolve(RickAndMortyGraphQLRepositoriesType.self))
        }.implements( AnyUseCase< Int, CharacterResultObject>.self)
        
        Resolver.register(SearchCharacterViewModel.self){ _ in
            return SearchCharacterViewModel(getCharactersUseCase: Resolver.resolve(AnyUseCase< Int, CharacterResultObject>.self))
        }
        
    }
    
    private func registerCharacterDetailDependencies() {
        Resolver.register(DetailCharacterViewModel.self){ _ in
            return DetailCharacterViewModel()
        }
    }
    
    func unregisterModuleDependencies(for module: AppModule) {
        registeredModules.remove(module)
        print("🗑️ Unregistered dependencies for module: \(module.rawValue)")
    }
}
