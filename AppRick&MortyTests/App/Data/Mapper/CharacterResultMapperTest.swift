//
//  CharacterResultMapperTest.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

@testable import AppRick_Morty
import XCTest

class CharacterResultMapperTest: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testDogsMapper_WhenInputIsFilled_ThenReturnObjectFilled() throws {
        // Given
        let input = TestDataConstants.characterResultResponse
        // when
        let result = CharacterResultMapper.map(input: input)
        // then
        XCTAssertEqual(result.results.count, input.results.count)
    }
}
