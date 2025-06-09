//
//  GraphQLQuery.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct GraphQLQuery {
    let query: String
    let variables: [String: Any]?
    
    init(query: String, variables: [String: Any]? = nil) {
        self.query = query
        self.variables = variables
    }
    
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = ["query": query]
        if let variables = variables {
            dict["variables"] = variables
        }
        return dict
    }
}
