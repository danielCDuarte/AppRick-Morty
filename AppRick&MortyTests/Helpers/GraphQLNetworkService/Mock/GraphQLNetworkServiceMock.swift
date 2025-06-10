//
//  GraphQLNetworkServiceMock.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

@testable import AppRick_Morty

final class GraphQLNetworkServiceMock {
    static var error: Error?
    static var response: AnyObject!
}

extension GraphQLNetworkServiceMock: GraphQLNetworkServiceType {
    func fetch<Response>(_ graphQLRequest: GraphQLRequest<Response>, queue: DispatchQueue) async throws -> Response where Response: Decodable {
        var respObject: Response! = nil
       
        if GraphQLNetworkServiceMock.response != nil {
            respObject = GraphQLNetworkServiceMock.response as? Response
           
        }
        if let error = GraphQLNetworkServiceMock.error {
            throw error
        }
        return respObject
    }
    
}
