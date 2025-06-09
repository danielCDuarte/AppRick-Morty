//
//  SearchCharacterView.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Resolver
import SwiftUI
import SkeletonUI

struct SearchCharacterView<ViewModelType>: View where ViewModelType: SearchCharacterViewModelType {
    @ObservedObject var viewModel: ViewModelType = Resolver.resolve()
    @State private var isRefreshing = false
    
    var body: some View {
        NavigationStack {
            SkeletonList(with: viewModel.state.searchText.isEmpty ? viewModel.state.characters : viewModel.state.searchCharacters ,
                         quantity: viewModel.state.numberSkeletonCell) { loading, character in
                NavigationLink {
                    DetailCharacterView<DetailCharacterViewModel>(character: character)
                }label: {
                    CharacterCell(character: character, loading: loading)
                }
                .onAppear {
                    viewModel.loadMoreContentIfNeeded(currentItem: character)
                }
            }
                         .refreshable {
                             isRefreshing = true
                             viewModel.refreshData()
                             isRefreshing = false
                         }
                         .scrollContentBackground(.hidden)
                         .navigationBarTitle(SearchCharacterState.Constants.title, displayMode: .inline)
                         .searchable(
                            text: $viewModel.state.searchText,
                            placement: .navigationBarDrawer(displayMode: .always)
                         )
                         .autocorrectionDisabled()
                         .textInputAutocapitalization(.never)
                         .onChange(of: viewModel.state.searchText) {
                             viewModel.searchCharacter(query: viewModel.state.searchText)
                         }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .onDisappear {
            viewModel.onDisAppear()
        }
        .alert(isPresented: $viewModel.state.alert) {
            Alert(
                title: Text(SearchCharacterState.Constants.error),
                message: Text(SearchCharacterState.Constants.errorMessage),
                dismissButton: .cancel(Text(SearchCharacterState.Constants.accept)))
        }
    }
}
