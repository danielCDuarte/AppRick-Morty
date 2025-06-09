//
//  APICharacterResponse.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct APICharacterResponse: Codable {
    let id: String
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: APILocationResponse
    let location: APILocationResponse
    let image: String
    let episode: [APIEpisodeResponse]
    let created: String
}

struct APILocationResponse: Codable {
    let id: String
    let name: String
    let type: String?
    let dimension: String?
    let residents: [APICharacterResponse]?
    let created: String?
}

struct APIEpisodeResponse: Codable {
    let id: String
    let name: String
    let episode: String
    let air_date: String?
    let characters: [APICharacterResponse]?
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, created
        case air_date = "air_date"
    }
}
