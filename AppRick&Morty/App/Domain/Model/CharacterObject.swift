//
//  CharacterObject.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

enum StatusCharacter: String {
    case Alive
    case Dead
    case unknown
}

enum GenderCharacter: String {
    case Male
    case Female
    case unknown
}

struct CharacterObject: Identifiable {
    var id: String
    var name: String
    var status: StatusCharacter
    var species: String
    var type: String
    var gender: GenderCharacter
    var origin: LocationObject
    var location: LocationObject
    var image: String
    var episode: [EpisodeObject]
    var created: String
}
