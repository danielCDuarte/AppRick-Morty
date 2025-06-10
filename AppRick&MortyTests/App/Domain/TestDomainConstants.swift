//
//  TestDomainConstants.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
@testable import AppRick_Morty

struct TestDomainConstants {
    static let characterResultObject: CharacterResultObject = {
        return .init(
            info: .init(count: 1, pages: 1),
            results: [
                .init(
                    id: "2",
                    name: "Rick test",
                    status: .Alive,
                    species: "Human",
                    type: "",
                    gender: .Male,
                    origin: .init(name: "Earth (C-137)"),
                    location: .init(name: "Citadel of Ricks"),
                    image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
                    episode: [
                        .init(name: "Rick Potion #9"),
                        .init(name: "Raising Gazorpazorp"),
                        .init(name: "Rixty Minutes")
                    ],
                    created: "2017-11-04T18:48:46.250Z")
            ])
    }()
}

