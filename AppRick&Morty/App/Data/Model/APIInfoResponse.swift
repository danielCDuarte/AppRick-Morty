//
//  APIInfoResponse.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

struct APIInfoResponse: Codable {
    var count: Int
    var pages: Int
    var next: Int?
    var prev: Int?
}
