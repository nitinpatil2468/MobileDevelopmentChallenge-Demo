//
//  RemoteMoviesDataSourceTest.swift
//  MobileDevelopmentChallengeTests
//
//  Created by capgemini on 29/01/25.
//

import XCTest
@testable import MobileDevelopmentChallenge

class RemoteMoviesDataSourceTests: XCTestCase {
    
    var dataSource: RemoteMoviesDataSource!
    var mockAPIClient: MockAPIClient!
    
    override func setUp() {
        super.setUp()
        mockAPIClient = MockAPIClient()
        dataSource = RemoteMoviesDataSource(apiClient: mockAPIClient)
    }
    
    override func tearDown() {
        dataSource = nil
        mockAPIClient = nil
        super.tearDown()
    }
    
    // Test case for successful movie fetch
    func testFetchMoviesSuccess() async {
        let movieData = [MovieData(id: "1", name: "Inception", runtimeInMinutes: 148, budgetInMillions: 160, boxOfficeRevenueInMillions: 836.8, academyAwardNominations: 8, academyAwardWINS: 4, rottenTomatoesScore: 86.0)]
        let expectedResponse = GetMovieResponse(docs: movieData, total: 1, limit: 10, offset: 0, page: 1, pages: 1, error: nil)
        mockAPIClient.result = .success(expectedResponse)
        
        do {
            let response = try await dataSource.fetchMovies()
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.docs?.count, 1)
            XCTAssertEqual(response?.docs?.first?.name, "Inception")
        } catch {
            XCTFail("Expected success, but got error: \(error)")
        }
    }

    // Test case for failed movie fetch (e.g., network failure)
    func testFetchMoviesFailure() async {
        mockAPIClient.result = .failure(NetworkingError.otherError(error: ""))
        do {
            let _ = try await dataSource.fetchMovies()
            XCTFail("Expected failure, but got a successful response.")
        } catch let error as NetworkingError {
            // Then
            XCTAssertEqual(error.userFriendlyMessage, NetworkingError.otherError(error: "").userFriendlyMessage)
        } catch {
            XCTFail("Expected NetworkingError, but got a different error: \(error)")
        }
    }
}
