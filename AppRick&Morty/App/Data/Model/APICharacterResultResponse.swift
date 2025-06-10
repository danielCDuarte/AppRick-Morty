//
//  APICharacterResultResponse.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct APICharactersResponse: Codable {
    let dataContent: APICharactersData
    enum CodingKeys: String, CodingKey {
        case dataContent = "data"
    }
}

struct APICharactersData: Codable {
    let characters: APICharacterResultResponse
}

struct APICharacterResultResponse: Codable {
    let info: APIInfoResponse
    let results: [APICharacterResponse]
}
