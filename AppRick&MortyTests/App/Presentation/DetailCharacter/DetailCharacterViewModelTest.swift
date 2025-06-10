//
//  DetailCharacterViewModelTest.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import XCTest
import Resolver
@testable import AppRick_Morty

class DetailCharacterTest: XCTestCase {
    private var sut: DetailCharacterViewModel!
    
    override func setUp() {
        sut = DetailCharacterViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenStateEmptyViewDataWasChanged() {
        // Given
       
        // When
        sut.onDisAppear()
        
        // Then
        XCTAssertFalse(sut.loading)
    }
  
}
