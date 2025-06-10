//
//  GetCharactersUseCaseStub.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
@testable import AppRick_Morty

class GetCharactersUseCaseStub: AnyUseCase< Int, CharacterResultObject> {
    static var error: Error?
    static var response: CharacterResultObject!
    
    override func execute(params: Int) async throws -> CharacterResultObject {
        let data: CharacterResultObject = GetCharactersUseCaseStub.response ?? .init(info: .init(count: 1, pages: 1), results: [])
        if let error = GetCharactersUseCaseStub.error {
            throw error
        }
        return data
    }
}
