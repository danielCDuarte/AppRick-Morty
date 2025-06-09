//
//  CharactersObject.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct CharactersObject {
    let characters: CharacterConnectionObject
}

struct CharacterConnectionObject {
    let info: InfoObject
    let results: [CharacterObject]
}

struct InfoObject {
    let count: Int
    let pages: Int
    let next: Int?
    let prev: Int?
}
