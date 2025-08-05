//
//  Coordinator.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 5/08/25.
//

import SwiftUI
import Resolver

enum CoordinatorDestination: Hashable {
    case searchCharacter
    case characterDetail(CharacterObject)
    
    var module: AppModule {
        switch self {
        case .searchCharacter:
            return .searchCharacter
        case .characterDetail:
            return .characterDetail
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .searchCharacter:
            hasher.combine("searchCharacter")
        case .characterDetail(let character):
            hasher.combine("characterDetail")
            hasher.combine(character)
        }
    }
    
    static func == (lhs: CoordinatorDestination, rhs: CoordinatorDestination) -> Bool {
        switch (lhs, rhs) {
        case (.searchCharacter, .searchCharacter):
            return true
        case (.characterDetail(let lhsCharacter), .characterDetail(let rhsCharacter)):
            return lhsCharacter == rhsCharacter
        default:
            return false
        }
    }
}
