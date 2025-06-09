//
//  DetailCharacterViewModel.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Combine
import Resolver
import Foundation

final class DetailCharacterViewModel: BaseViewModel {
    private var character: CharacterObject?
    @Published var state = DetailCharacterState()
}

extension DetailCharacterViewModel: DetailCharacterViewModelType {
    
    func onDisAppear() {
        loading = false
    }
}
