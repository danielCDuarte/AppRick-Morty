//
//  DetailCharacterState.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
import SwiftUI

final class DetailCharacterState: ObservableObject {
    @Published var character: CharacterObject?
    @Published var isLoading: Bool = false
    
    enum Constants {
        static let title = "Character"
        static let properties = "Properties"
        static let status = "Status:"
        static let gender = "Gender:"
        static let origin = "Origin:"
        static let location = "Location:"
        static let episodes = "Episodes:"
    }
}

