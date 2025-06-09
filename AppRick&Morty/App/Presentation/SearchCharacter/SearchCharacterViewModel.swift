//
//  SearchCharacterViewModel.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Resolver
import Foundation

final class SearchCharacterViewModel: BaseViewModel {
    private var characters: [CharacterObject]?
    @Published var state = SearchCharacterState()
    private var page = 1
    private let getCharactersUseCase: AnyUseCase< Int, CharacterResultObject>
    
    init(getCharactersUseCase:AnyUseCase< Int, CharacterResultObject>) {
            self.getCharactersUseCase = getCharactersUseCase
            super.init()
            errorHandler = self
    }
    
    private func getCharacters() async {
        do {
            let result = try await getCharactersUseCase.execute(params: page)
            await MainActor.run {
                self.bindCharacters(result.results)
            }
        } catch let error {
            await MainActor.run {
                self.showError(error: error)
            }
        }
    }
    
    private func bindCharacters(_ charactersObject: [CharacterObject]) {
        characters = charactersObject
        state.characters = charactersObject
        state.isLoading = false
        objectWillChange.send()
    }
    
    private func searchCharacters(by query: String) {
        let filterResults = characters?.filter { characters in
            characters.name.lowercased().contains(query.lowercased())
        } ?? []
        state.characters = filterResults
        state.isLoading = false
        objectWillChange.send()
    }
    
}

extension SearchCharacterViewModel: SearchCharacterViewModelType {
    func searchCharacter(query: String) {
        searchCharacters(by: query)
    }
    
    func onAppear() {
        Task {
            await getCharacters()
        }
    }
    
    func onDisAppear() {
        loading = false
    }
    
}

extension SearchCharacterViewModel: BaseView {
    func showError(error: Error) {
        state.alert = true
        objectWillChange.send()
    }
}
