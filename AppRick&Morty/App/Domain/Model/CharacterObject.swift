//
//  CharacterObject.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct CharacterObject {
    let id: String
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: LocationObject
    let location: LocationObject
    let image: String
    let episode: [EpisodeObject]
    let created: String
}

struct LocationObject {
    let id: String
    let name: String
    let type: String?
    let dimension: String?
    let residents: [CharacterObject]?
    let created: String?
}

struct EpisodeObject {
    let id: String
    let name: String
    let episode: String
    let air_date: String?
    let characters: [CharacterObject]?
    let created: String
}
