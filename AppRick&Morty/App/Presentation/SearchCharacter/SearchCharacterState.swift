//
//  SearchCharacterState.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
import SwiftUI

final class SearchCharacterState: ObservableObject {
    @Published var characters: [CharacterObject] = []
    @Published var searchCharacters: [CharacterObject] = []
    @Published var isLoading: Bool = true
    @Published var numberSkeletonCell: Int = 8
    @Published var alert: Bool = false
    @Published var searchText = ""
    
    enum Constants {
        static let title = "Search characters"
        static let error = "An error has occurred."
        static let errorMessage = "An error has occurred, please try again later."
        static let accept = "Ok"
        static let searchCharacters = "Search characters"
    }
}
