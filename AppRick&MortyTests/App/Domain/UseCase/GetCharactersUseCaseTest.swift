//
//  GetCharactersUseCaseTest.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

@testable import AppRick_Morty
import XCTest

class GetCharactersUseCaseTest: XCTestCase {
    private var rickAndMortyGraphQLRepositoriesStub: RickAndMortyGraphQLRepositoriesStub!
    private var sut: GetCharactersUseCase!
   
    
    override func setUpWithError() throws {
        rickAndMortyGraphQLRepositoriesStub = RickAndMortyGraphQLRepositoriesStub()
        sut = .init(repository: rickAndMortyGraphQLRepositoriesStub)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        RickAndMortyGraphQLRepositoriesStub.error = nil
        RickAndMortyGraphQLRepositoriesStub.response = nil
    }
    
    func testGetCharactersUseCase_ResponseSuccess() async {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume use case Response Expectation")
        expectationFailure.isInverted = true
        
        RickAndMortyGraphQLRepositoriesStub.response = TestDomainConstants.characterResultObject
        
        //When
        do {
            let response = try await sut.execute(params: 1)
            // Then
            XCTAssertFalse(response.results.isEmpty)
            expectation.fulfill()
        } catch let error {
            XCTFail(error.localizedDescription)
            expectationFailure.fulfill()
        }
        
        await fulfillment(of: [expectationFailure, expectation], timeout: 1.0)
    }
    
    func testGetCharactersUseCase_ResponseError() async {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = self.expectation(description: "Consume use case Response Expectation")
        expectation.isInverted = true
        
        RickAndMortyGraphQLRepositoriesStub.error = NetworkError.emptyJson
        
        //When
        do {
            _ = try await sut.execute(params: 1)
            expectation.fulfill()
        } catch let error {
            // Then
            let jsonEmptyError = NetworkError.emptyJson.localizedDescription
            XCTAssertEqual(error.localizedDescription, jsonEmptyError)
            expectationFailure.fulfill()
        }
        
        await fulfillment(of: [expectationFailure, expectation], timeout: 1.0)
    }
}
