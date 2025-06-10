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
