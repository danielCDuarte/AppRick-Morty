//
//  RickAndMortyGraphQLRepositoriesTest.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

import Foundation
import XCTest

@testable import AppRick_Morty

final class RickAndMortyGraphQLRepositoriesTest: XCTestCase {
    private var graphQLNetworkService: GraphQLNetworkServiceType!
    private var sut: RickAndMortyGraphQLRepositories!
    
    override func setUp() {
        super.setUp()
        graphQLNetworkService = GraphQLNetworkServiceMock()
        sut = RickAndMortyGraphQLRepositories(graphQLNetworkService: graphQLNetworkService)
    }
    
    override func tearDown() {
        GraphQLNetworkServiceMock.response = nil
        GraphQLNetworkServiceMock.error = nil
        sut = nil
        super.tearDown()
    }
    
    func testRickAndMortyGraphQLRepositories_ResponseSuccess() async {
        //Given
        let expectationFailure = expectation(description: "failure")
        let successExpectation = expectation(description: "Consume Web Service Response Expectation")
        expectationFailure.isInverted = true
        
        GraphQLNetworkServiceMock.response = TestDataConstants.charactersResponse as AnyObject
        
        //When
        do {
            // then
            let response = try await sut.getCharacters(page: 2, filter: nil)
            XCTAssertNotNil(response)
            successExpectation.fulfill()
            
        } catch {
            XCTFail(error.localizedDescription)
            expectationFailure.fulfill()
        }
        
        //Then
        await fulfillment(of: [expectationFailure, successExpectation], timeout: 1.0)
    }
    
    func testRickAndMortyGraphQLRepositories_ResponseFailure() async {
        //Given
        let expectationFailure = expectation(description: "failure")
        let expectation = expectation(description: "Consume Web Service Response Expectation")
        expectation.isInverted = true
        GraphQLNetworkServiceMock.response = TestDataConstants.charactersResponse as AnyObject
        GraphQLNetworkServiceMock.error = NetworkError.emptyJson
        
        //When
        do {
            _ = try await sut.getCharacters(page: 2, filter: nil)
            expectation.fulfill()
        } catch let error {
            // then
            XCTAssertEqual(error.localizedDescription, NetworkError.emptyJson.localizedDescription)
            expectationFailure.fulfill()
        }
        
        //Then
        await fulfillment(of: [expectationFailure, expectation], timeout: 1.0)
    }
    
}
