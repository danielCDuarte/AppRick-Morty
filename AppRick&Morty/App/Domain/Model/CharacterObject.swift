//
//  CharacterObject.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

enum StatusCharacter: String, CaseIterable, Hashable {
    case Alive
    case Dead
    case unknown
}

enum GenderCharacter: String, CaseIterable, Hashable {
    case Male
    case Female
    case unknown
}

struct CharacterObject: Identifiable, Hashable {
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(status)
        hasher.combine(species)
        hasher.combine(type)
        hasher.combine(gender)
        hasher.combine(origin)
        hasher.combine(location)
        hasher.combine(image)
        hasher.combine(episode)
        hasher.combine(created)
    }
    
    static func == (lhs: CharacterObject, rhs: CharacterObject) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.status == rhs.status &&
        lhs.species == rhs.species &&
        lhs.type == rhs.type &&
        lhs.gender == rhs.gender &&
        lhs.origin == rhs.origin &&
        lhs.location == rhs.location &&
        lhs.image == rhs.image &&
        lhs.episode == rhs.episode &&
        lhs.created == rhs.created
    }
}
