//
//  GetCharactersUseCase.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

class GetCharactersUseCase: AnyUseCase< Int, CharacterResultObject> {
    let repository: RickAndMortyGraphQLRepositoriesType
    
    init(repository: RickAndMortyGraphQLRepositoriesType) {
        self.repository = repository
    }
    
    override func execute(params: Int) async throws -> CharacterResultObject {
        do {
            return try await self.repository.getCharacters(page: params, filter: nil)
        } catch {
            throw error
        }
    }
}
