//
//  TestDataConstants.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
@testable import AppRick_Morty

struct TestDataConstants {
    static let charactersResponse : APICharactersResponse = APICharactersResponse(
        dataContent: .init(
            characters: .init(
                info: .init(
                    count: 826,
                    pages: 42,
                    next: 2,
                    prev: 1
                ),
                results: [
                    .init(
                        id: "1",
                        name: "Rick Sanchez",
                        status: "Alive",
                        species: "Human",
                        type: "",
                        gender: "Male",
                        origin: .init(name: "Earth (C-137)"),
                        location: .init(name: "Citadel of Ricks"),
                        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                        episode: [
                            .init(name: "Rick Potion #9"),
                            .init(name: "Raising Gazorpazorp"),
                            .init(name: "Rixty Minutes")
                        ],
                        created: "2017-11-04T19:09:56.428Z"
                    ),
                    .init(
                        id: "2",
                        name: "Rick test",
                        status: "Alive",
                        species: "Human",
                        type: "",
                        gender: "Male",
                        origin: .init(name: "Earth (C-137)"),
                        location: .init(name: "Citadel of Ricks"),
                        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                        episode: [
                            .init(name: "Rick Potion #9"),
                            .init(name: "Raising Gazorpazorp"),
                            .init(name: "Rixty Minutes")
                        ],
                        created: "2017-11-04T18:48:46.250Z"
                    )
                ]
            )
        )
    )
    
    
    static let characterResultResponse: APICharacterResultResponse = {
        return .init(
            info: .init(
                count: 826,
                pages: 42,
                next: 2,
                prev: nil
            ),
            results: [ .init(
                id: "1",
                name: "Rick Sanchez",
                status: "Alive",
                species: "Human",
                type: "",
                gender: "Male",
                origin: .init(
                    name: "Earth (C-137)",
                ),
                location: .init(
                    name: "Citadel of Ricks",
                ),
                image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                episode: [
                    .init(name: "Rick Potion #9"),
                    .init(name: "Raising Gazorpazorp"),
                    .init(name: "Rixty Minutes")
                ],
                created: "2017-11-04T19:09:56.428Z"
            ),
                       .init(
                        id: "2",
                        name: "Rick test",
                        status: "Alive",
                        species: "Human",
                        type: "",
                        gender: "Male",
                        origin: .init(
                            name: "Earth (C-137)",
                        ),
                        location: .init(
                            name: "Citadel of Ricks",
                        ),
                        image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                        episode: [
                            .init(name: "Rick Potion #9"),
                            .init(name: "Raising Gazorpazorp"),
                            .init(name: "Rixty Minutes")
                        ],
                        created: "2017-11-04T18:48:46.250Z"
                       )]
        )
    }()
}
