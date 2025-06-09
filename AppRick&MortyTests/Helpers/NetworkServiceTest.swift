//
//  NetworkServiceTest.swift
//  AppRick&Morty
//
//  Created by Daniel Crespo Duarte on 9/06/25.
//

@testable import AppRick_Morty
import XCTest

//class NetworkServiceTest: XCTestCase {
//    private var sut: NetworkServiceType!
//    private var session: URLSession!
//    private var decoder: JSONDecoder!
//    static let baseUrl = DataConstants.baseUrl
//    
//    override func setUpWithError() throws {
//        let config = URLSessionConfiguration.ephemeral
//        config.protocolClasses = [URLProtocolMock.self]
//        session = URLSession(configuration: config)
//        decoder = JSONDecoder()
//        sut = NetworkService(url: DataConstants.baseUrl, urlSession: session, decoder: decoder)
//    }
//    
//    override func tearDownWithError() throws {
//        sut = nil
//        URLProtocolMock.testURLs = [:]
//        URLProtocolMock.error = nil
//        URLProtocolMock.response = nil
//    }
//    
//    func testNetworkService_WhenMakeARequestSuccessful_ThenTheResponseShouldBeSuccess() async throws {
//        //Given
//        let expectationReceive = expectation(description: "receiveValue")
//        let expectationFailure = expectation(description: "failure")
//        expectationFailure.isInverted = true
//        
//        let endPoint = NetworkRequest<[APICharactersResponse]>(
//            method: .POST,
//            relativePath: "",
//            parameters: nil
//        )
//        
//        let usersURL = URL.getUrl(from: DataConstants.baseUrl)
//        let encoder = JSONEncoder()
//        let jsonData = try encoder.encode(TestDataConstants.dogsResponse)
//        
//        URLProtocolMock.testURLs = [usersURL: jsonData]
//        URLProtocolMock.response = HTTPURLResponse(
//            url: URL(string: "http://localhost:5000")!,
//            statusCode: 200,
//            httpVersion: nil,
//            headerFields: nil
//        )
//        
//        //When
//        do {
//            let response = try await sut.request(endPoint, queue: .main)
//            XCTAssertNotNil(response)
//            expectationReceive.fulfill()
//        } catch {
//            XCTFail(error.localizedDescription)
//            expectationFailure.fulfill()
//        }
//        
//        //Then
//        await fulfillment(of: [expectationReceive, expectationFailure], timeout: 1.0)
//    }
//    
//    func testNetworkService_WhenMakeARequestSuccessfulButRequestFail_ThenCatchAError() async throws {
//        //Given
//        let expectationFailure = expectation(description: "Should fail")
//        
//        let endPoint = NetworkRequest<[APICharactersResponse]>(
//            method: .GET,
//            relativePath: "",
//            parameters: nil
//        )
//        
//        URLProtocolMock.response = HTTPURLResponse(
//            url: URL(string: "http://localhost:5000/")!,
//            statusCode: 500,
//            httpVersion: nil,
//            headerFields: nil
//        )
//        
//        //When
//        do {
//            _ = try await sut.request(endPoint, queue: .main)
//            XCTFail("Expected to throw error but succeeded")
//        } catch {
//            if case NetworkError.apiError(let code, _) = error {
//                XCTAssertEqual(code, 500)
//            } else {
//                XCTFail("Unexpected error type: \(error)")
//            }
//            expectationFailure.fulfill()
//        }
//        
//        //Then
//        await fulfillment(of: [expectationFailure], timeout: 1.0)
//    }
//    
//    func testNetworkService_WhenInvalidURL_ThenCatchAError() async throws {
//        //Given
//        let expectationReceive = expectation(description: "Invalid.receiveValue")
//        expectationReceive.isInverted = true
//        let expectationFailure = expectation(description: "Invalid.failure")
//        
//        sut = NetworkService(url: "", urlSession: session, decoder: decoder)
//        
//        let endPoint = NetworkRequest<String>(
//            method: .GET,
//            relativePath: "",
//            parameters: nil
//        )
//        
//        URLProtocolMock.response = HTTPURLResponse(
//            url: URL(string: "http://localhost:5000/")!,
//            statusCode: 500,
//            httpVersion: nil,
//            headerFields: nil)
//        
//        //When
//        do {
//            let response = try await sut.request(endPoint, queue: .main)
//            XCTAssertNotNil(response)
//            print(response)
//            expectationReceive.fulfill()
//        }
//        catch {
//            print(error.localizedDescription)
//            expectationFailure.fulfill()
//        }
//        
//        
//        //Then
//        await fulfillment(of: [expectationReceive, expectationFailure], timeout: 1.0)
//    }
//}
//
