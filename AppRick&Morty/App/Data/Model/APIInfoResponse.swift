//
//  APIInfoResponse.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct APIInfoResponse: Codable {
    let count: Int
    let pages: Int
    let next: Int?
    let prev: Int?
}
