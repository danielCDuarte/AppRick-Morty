//
//  RickAndMortyGraphQLRepositoriesType.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

protocol RickAndMortyGraphQLRepositoriesType {
    func getCharacters(page: Int = 1, filter: CharacterFilter? = nil) async throws -> CharactersObject
}
