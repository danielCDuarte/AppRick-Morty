//
//  MapperType.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation

protocol MapperType {
    associatedtype Input
    associatedtype Output
    
    static func map(input: Input) -> Output
}
