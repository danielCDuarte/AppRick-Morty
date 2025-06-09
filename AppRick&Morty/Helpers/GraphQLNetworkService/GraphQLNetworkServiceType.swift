//
//  GraphQLNetworkServiceType.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

protocol GraphQLNetworkServiceType {
    func fetch<Response>(
        _ graphQLRequest: GraphQLRequest<Response>,
        queue: DispatchQueue
    ) async throws -> Response
}
