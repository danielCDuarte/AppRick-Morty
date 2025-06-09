//
//  GraphQLRequest.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//
import Foundation

class GraphQLRequest<Response: Codable> {
    let query: GraphQLQuery
    let headers: [String: String]?
    let decode: (Data) throws -> Response
    
    init(query: GraphQLQuery,
         headers: [String: String]? = nil,
         decode: @escaping (Data) throws -> Response) {
        self.query = query
        self.headers = headers
        self.decode = decode
    }
}

extension GraphQLRequest where Response: Decodable {
    convenience init(query: GraphQLQuery,
                    headers: [String: String]? = nil) {
        self.init(
            query: query,
            headers: headers) {
            let decoder = JSONDecoder()
            let graphQLResponse = try decoder.decode(GraphQLResponse<Response>.self, from: $0)
            
            if let errors = graphQLResponse.errors, !errors.isEmpty {
                let errorMessage = errors.map { $0.message }.joined(separator: ", ")
                throw NetworkError.apiError(code: 400, error: errorMessage)
            }
            
            guard let data = graphQLResponse.data else {
                throw NetworkError.emptyJson
            }
            
            return data
        }
    }
}
