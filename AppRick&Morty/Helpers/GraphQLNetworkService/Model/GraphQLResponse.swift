//
//  GraphQLResponse.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct GraphQLResponse<T: Codable>: Codable {
    let data: T?
    let errors: [GraphQLError]?
}

struct GraphQLError: Codable {
    let message: String
    let locations: [GraphQLLocation]?
    let path: [String]?
}

struct GraphQLLocation: Codable {
    let line: Int
    let column: Int
}
