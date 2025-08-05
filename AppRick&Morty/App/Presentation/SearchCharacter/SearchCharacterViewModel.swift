//
//  SearchCharacterViewModel.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Resolver
import Foundation

final class SearchCharacterViewModel: BaseViewModel {
    @Published var state = SearchCharacterState()
    @Injected private var coordinator: AppCoordinator
    private var characters: [CharacterObject] = []
    private var currentPage = 1
    private var totalPages = 1
    private var isFetching = false
    private let getCharactersUseCase: AnyUseCase< Int, CharacterResultObject>
    
    init(getCharactersUseCase:AnyUseCase< Int, CharacterResultObject>) {
        self.getCharactersUseCase = getCharactersUseCase
        super.init()
        errorHandler = self
    }
    
    private func fetchCharacters(resetData: Bool = false) async {
        guard !isFetching, currentPage <= totalPages || resetData else { return }
        isFetching = true
        state.isLoading = true
        
        if resetData {
            currentPage = 1
        }
        
        do {
            let result = try await getCharactersUseCase.execute(params: currentPage)
            
            await MainActor.run {
                self.bindCharacterResult(result, resetData: resetData)
            }
        } catch {
            await MainActor.run {
                self.showError(error: error)
                self.isFetching = false
                self.state.isLoading = false
            }
        }
    }
    
    private func bindCharacterResult(_ characterResultObject: CharacterResultObject, resetData: Bool) {
        self.totalPages = characterResultObject.info.pages
        if resetData {
            self.characters = characterResultObject.results
        } else {
            self.characters.append(contentsOf: characterResultObject.results)
        }
        self.updateCharacterList()
        if !resetData {
            self.currentPage += 1
        }
        self.isFetching = false
        self.state.isLoading = false
        objectWillChange.send()
    }
    
    private func updateCharacterList() {
        if state.searchText.isEmpty {
            state.characters = characters
        } else {
            searchCharacters(by: state.searchText)
        }
    }
    
    private func searchCharacters(by query: String) {
        let filterResults = characters.filter { characters in
            characters.name.lowercased().contains(query.lowercased())
        }
        state.searchCharacters = filterResults
        state.isLoading = false
        objectWillChange.send()
    }
    
}

extension SearchCharacterViewModel: SearchCharacterViewModelType {
    
    func didSelectCharacter(_ character: CharacterObject?) {
        guard let character = character else { return }
        coordinator.navigateTo(.characterDetail(character))
    }
    
    func loadMoreContentIfNeeded(currentItem item: CharacterObject?) {
        guard let item = item,
              !isFetching,
              !state.isLoading,
              currentPage <= totalPages else { return }
        
        let thresholdIndex = characters.index(characters.endIndex, offsetBy: -5)
        if let itemIndex = characters.firstIndex(where: { $0.id == item.id }),
           itemIndex >= thresholdIndex {
            Task {
                await fetchCharacters()
            }
        }
    }
    
    func refreshData() {
        Task {
            await fetchCharacters(resetData: true)
        }
    }
    
    func searchCharacter(query: String) {
        searchCharacters(by: query)
    }
    
    func onAppear() {
        if characters.isEmpty {
            Task {
                await fetchCharacters()
            }
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
