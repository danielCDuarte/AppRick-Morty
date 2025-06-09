//
//  RickAndMortyGraphQLRepositories.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

class RickAndMortyGraphQLRepositories: RickAndMortyGraphQLRepositoriesType {
    
    private(set) var graphQLNetworkService: GraphQLNetworkServiceType
    
    init(graphQLNetworkService: GraphQLNetworkServiceType) {
        self.graphQLNetworkService = graphQLNetworkService
    }
    
    
    func getCharacters(page: Int = 1, filter: CharacterFilter? = nil) async throws -> CharactersObject {
        var variables: [String: Any] = ["page": page]
        
        if let filter = filter {
            variables["filter"] = filter.toDictionary()
        }
        
        let query = GraphQLQuery(
            query: """
                   query GetCharacters($page: Int, $filter: FilterCharacter) {
                       characters(page: $page, filter: $filter) {
                           info {
                               count
                               pages
                               next
                               prev
                           }
                           results {
                               id
                               name
                               status
                               species
                               type
                               gender
                               origin {
                                   id
                                   name
                                   dimension
                               }
                               location {
                                   id
                                   name
                                   dimension
                               }
                               image
                               episode {
                                   id
                                   name
                                   episode
                               }
                               created
                           }
                       }
                   }
                   """,
            variables: variables
        )
        
        let request = GraphQLRequest<APICharactersResponse>(query: query)
        return try await graphQLService.execute(request)
    }
}
