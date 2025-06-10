//
//  SearchCharacterTest.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import XCTest
import Resolver
@testable import AppRick_Morty

class SearchCharacterViewModelTest: XCTestCase {
    private var sut: SearchCharacterViewModel!
    
    override func setUp() {
        Resolver.registerPresentationMockServices()
        sut = SearchCharacterViewModel(getCharactersUseCase: Resolver.resolve(AnyUseCase<Int, CharacterResultObject>.self))
    }
    
    override func tearDown() {
        GetCharactersUseCaseStub.error = nil
        sut = nil
        super.tearDown()
    }
    
    
    func testOnAppear_WhenReturnSuccess_ThenChangeCharactersWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get characters")
        GetCharactersUseCaseStub.response = TestDomainConstants.characterResultObject
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(!sut.state.characters.isEmpty)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testOnAppear_WhenThereIsError_ThenChangeStateAlertWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get characters")
        GetCharactersUseCaseStub.error = NetworkError.serverError
        // When
        sut.onAppear()
        
        // Then
        let result = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertTrue(sut.state.alert)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testSearchCharacters_WhenReturnSuccess_ThenChangeStateSearchCharactersWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Schemes")
        GetCharactersUseCaseStub.response = TestDomainConstants.characterResultObject
        
        // When
        sut.onAppear()
        
        // Then
        _ = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        sut.searchCharacter(query: "Rick")
        XCTAssertTrue(!sut.state.searchCharacters.isEmpty)
    }
    
    func testRefreshData_WhenReturnSuccess_ThenChangeStateCharactersWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Schemes")
        GetCharactersUseCaseStub.response = TestDomainConstants.characterResultObject
        
        // When
        sut.refreshData()
        
        // Then
        _ = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(!sut.state.characters.isEmpty)
    }
    
    func tesLoadMoreContentIfNeeded_WhenReturnSuccess_ThenChangeStateCharactersWasChanged() {
        // Given
        let expectation = XCTestExpectation(description: "get Schemes")
        GetCharactersUseCaseStub.response = TestDomainConstants.characterResultObject
        
        // When
        sut.loadMoreContentIfNeeded(currentItem: TestDomainConstants.characterResultObject.results.first, )
        
        // Then
        _ = XCTWaiter.wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(!sut.state.characters.isEmpty)
    }
    
    func testOnDisAppear_WhenThereIsChangeState_ThenStateEmptyViewDataWasChanged() {
        // When
        sut.onDisAppear()
        // Then
        XCTAssertFalse(sut.loading)
    }
}
