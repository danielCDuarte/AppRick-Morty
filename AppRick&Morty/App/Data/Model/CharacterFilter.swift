//
//  CharacterFilter.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//
import Foundation

struct CharacterFilter {
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]
        if let name = name { dict["name"] = name }
        if let status = status { dict["status"] = status }
        if let species = species { dict["species"] = species }
        if let type = type { dict["type"] = type }
        if let gender = gender { dict["gender"] = gender }
        return dict
    }
}
