//
//  RickAndMortyGraphQLRepositoriesType.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

protocol RickAndMortyGraphQLRepositoriesType {
    func getCharacters(page: Int, filter: CharacterFilter?) async throws -> CharacterResultObject
}
