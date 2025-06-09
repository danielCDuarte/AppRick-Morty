//
//  APICharactersResponse.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct APICharactersResponse: Codable {
    let characters: APICharacterConnectionResponse
}

struct APICharacterConnectionResponse: Codable {
    let info: APIInfoResponse
    let results: [APICharacterResponse]
}

struct APIInfoResponse: Codable {
    let count: Int
    let pages: Int
    let next: Int?
    let prev: Int?
}
