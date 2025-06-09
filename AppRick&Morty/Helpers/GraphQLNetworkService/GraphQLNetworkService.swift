//
//  GraphQLNetworkService.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//
import Foundation

class GraphQLNetworkService: GraphQLNetworkServiceType {
    private let networkService: NetworkServiceType
    
    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    func fetch<Response: Codable>(_ graphQLRequest: GraphQLRequest<Response>, queue: DispatchQueue = .main) async throws -> Response {
        let networkRequest = NetworkRequest<Response>(
            method: .POST,
            relativePath: "",
            headers: graphQLRequest.headers,
            parameters: graphQLRequest.query.toDictionary(),
            decode: graphQLRequest.decode
        )
        return try await networkService.request(networkRequest, queue: queue)
    }

}
