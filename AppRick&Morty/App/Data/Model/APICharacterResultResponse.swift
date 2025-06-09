//
//  APICharacterResultResponse.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct APICharactersResponse: Codable {
    let data: CharactersData
    
    struct CharactersData: Codable {
        let characters: APICharacterResultResponse
    }
}

struct APICharacterResultResponse: Codable {
    var info: APIInfoResponse
    var results: [APICharacterResponse]
}
