//
//  URL+Extensions.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

extension URL {
    static func getUrl(from string: String?) -> URL? {
        return URL(string: string ?? "")
    }
}
