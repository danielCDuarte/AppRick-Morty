//
//  CharactersMapper.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct CharacterResultMapper: MapperType {

    typealias Input = APICharacterResultResponse
    typealias Output = CharacterResultObject
    
    static func map(input: APICharacterResultResponse) -> CharacterResultObject {
        return .init(
            info: getInfo(input: input.info),
            results: input.results.map {
                getCharacter(input: $0)
            }
        )
    }
    
    private static func getInfo(input: APIInfoResponse) -> InfoObject {
        return .init(
            count: input.count,
            pages: input.pages,
            next: input.next,
            prev: input.prev
        )
    }
    
    private static func getCharacter(input: APICharacterResponse) -> CharacterObject {
        return .init(
            id: input.id,
            name: input.name,
            status: StatusCharacter(rawValue: input.status) ?? .unknown,
            species: input.species,
            type: input.type,
            gender: GenderCharacter(rawValue:input.gender) ?? .unknown,
            origin: getLocation(input: input.origin),
            location: getLocation(input: input.location),
            image: input.image,
            episode: input.episode.map {
                getEpisode(input: $0)
            },
            created: input.created
        )
    }
            
    private static func getLocation(input: APILocationResponse) -> LocationObject {
        return .init(
            name: input.name
        )
    }
    
    private static func getEpisode(input: APIEpisodeResponse) -> EpisodeObject {
        return .init(
            name: input.name
        )
    }
}
