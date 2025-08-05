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
    @Injected private var coordinator: AppCoordinator
}

extension DetailCharacterViewModel: DetailCharacterViewModelType {
    func goBack() {
        coordinator.navigateBack()
    }
    
    func onDisAppear() {
        loading = false
    }
}
