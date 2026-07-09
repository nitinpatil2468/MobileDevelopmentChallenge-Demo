//
//  RemoteQuoteDataSourceTest.swift
//  MobileDevelopmentChallengeTests
//
//  Created by capgemini on 29/01/25.
//

import XCTest
@testable import MobileDevelopmentChallenge

class RemoteQuotesDataSourceTests: XCTestCase {
    var dataSource: RemoteQuotesDataSource!
    var mockAPIClient: MockAPIClient!
    
    override func setUp() {
        super.setUp()
        mockAPIClient = MockAPIClient()
        dataSource = RemoteQuotesDataSource(apiClient: mockAPIClient)
    }
    
    override func tearDown() {
        dataSource = nil
        mockAPIClient = nil
        super.tearDown()
    }
    
    // Test case for successful quote fetch
    func test_FetchQuotes_Success() async {
        let mockQuoteData = [
            QuoteData(id: "2", dialog: "I'll be back.", movie: "Terminator", character: "Terminator", docID: "2")
        ]
        let expectedResponse = GetQuotesResponse(docs: mockQuoteData, total: 1, limit: 1, offset: 0, page: 1, pages: 1, error: nil)
        mockAPIClient.result = .success(expectedResponse)
        
        do {
            let response = try await dataSource.fetchQuotes()
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.docs?.count, 1)
            XCTAssertEqual(response?.docs?.first?.dialog, "I'll be back.")
        } catch {
            XCTFail("Expected success, but got error: \(error)")
        }
    }
    
    // Test case for failed quote fetch
    func test_FetchQuotes_Failure() async {
        mockAPIClient.result = .failure(NetworkingError.otherError(error: "Backend Error"))
        do {
            let _ = try await dataSource.fetchQuotes()
            XCTFail("Expected failure, but got a successful response.")
        } catch let error as NetworkingError {
            XCTAssertEqual(error.userFriendlyMessage, NetworkingError.otherError(error: "Backend Error").userFriendlyMessage)
        } catch {
            XCTFail("Expected NetworkingError, but got a different error: \(error)")
        }
    }
    
    // Test case for empty quote list
    func test_FetchQuotesEmptyList() async {
        let expectedResponse = GetQuotesResponse(docs: [], total: 1, limit: 1, offset: 0, page: 1, pages: 1, error: nil)
        mockAPIClient.result = .success(expectedResponse)
        
        do {
            let response = try await dataSource.fetchQuotes()
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.docs?.count, 0)
        } catch {
            XCTFail("Expected success, but got error: \(error)")
        }
    }
}
