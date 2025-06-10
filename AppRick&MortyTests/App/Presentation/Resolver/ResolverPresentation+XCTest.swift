//
//  ResolverPresentation+XCTest.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
import Resolver
@testable import AppRick_Morty

extension Resolver  {
    static var mock = Resolver(child: .main)
    
    static func registerPresentationMockServices() {
        root = Resolver.mock
        defaultScope = .application
        
        mock.register {
            GetCharactersUseCaseStub()
        }.implements( AnyUseCase< Int, CharacterResultObject>.self)
        
    }
    
}

