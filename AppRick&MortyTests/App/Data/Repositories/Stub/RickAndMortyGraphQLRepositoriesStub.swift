//
//  RickAndMortyGraphQLRepositoriesStub.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
@testable import AppRick_Morty

final class RickAndMortyGraphQLRepositoriesStub {
    static var error: Error?
    static var response: CharacterResultObject!
}

extension RickAndMortyGraphQLRepositoriesStub: RickAndMortyGraphQLRepositoriesType {
    func getCharacters(page: Int, filter: AppRick_Morty.CharacterFilter?) async throws -> CharacterResultObject {
        let data: CharacterResultObject = RickAndMortyGraphQLRepositoriesStub.response ?? .init(info: .init(count: 0, pages: 0), results: [])
        if let error = RickAndMortyGraphQLRepositoriesStub.error {
            throw error
        }
        return data
    }
}
