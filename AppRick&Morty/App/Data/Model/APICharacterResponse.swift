//
//  APICharacterResponse.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct APICharacterResponse: Codable {
    var id: String
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: APILocationResponse
    var location: APILocationResponse
    var image: String
    var episode: [APIEpisodeResponse]
    var created: String
}
