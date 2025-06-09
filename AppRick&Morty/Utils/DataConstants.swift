//
//  DataConstants.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct DataConstants {
    enum APIClient {
        static let contentType: String = "Content-Type"
    }
    
    enum InnerConstants {
        static let applicationJson: String = "application/json"
    }

    
    static let baseUrl: String = "https://rickandmortyapi.com/graphql"
}
