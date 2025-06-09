//
//  Module+Injection.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
import Resolver
import SwiftData

extension Resolver {
    static func RegisterModuleDependencies (with baseUrl: String){
        registerData(with: baseUrl)
        registerDomain()
        registerPresentation()
    }
}

extension Resolver {
    static func registerData(with baseUrl: String){
        register {
            URLSession(configuration: URLSession.configuration())
        }
        
        register {
            NetworkService(url: baseUrl, urlSession: resolve(URLSession.self), decoder: JSONDecoder())
        }.implements(NetworkServiceType.self)
        
        register {
            GraphQLNetworkService(networkService: resolve(NetworkServiceType.self))
        }.implements(GraphQLNetworkServiceType.self)
        
        register {
            RickAndMortyGraphQLRepositories(graphQLNetworkService: resolve(GraphQLNetworkServiceType.self))
        }.implements(RickAndMortyGraphQLRepositoriesType.self)
        
    }
    
    static func registerDomain(){
        register {
            GetCharactersUseCase(repository: resolve(RickAndMortyGraphQLRepositoriesType.self))
        }.implements( AnyUseCase< Int, CharacterResultObject>.self)
    }
    
    static func registerPresentation(){
        register(SearchCharacterViewModel.self){ _ in
            return SearchCharacterViewModel(getCharactersUseCase: resolve(AnyUseCase< Int, CharacterResultObject>.self))
        }
        
        register(DetailCharacterViewModel.self){ _ in
            return DetailCharacterViewModel()
        }
        
    }
    
}
