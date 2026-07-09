//
//  FetchQuotesUseCaseTest.swift
//  MobileDevelopmentChallengeTests
//
//  Created by capgemini on 28/01/25.
//

import Foundation
import XCTest

@testable import MobileDevelopmentChallenge

final class FetchQuotesUseCaseTest: XCTestCase {
    
    var mockQuoteRepository: MockQuoteRepository!
    var mockQuoteMapper: MockQuoteMapper!
    var mockFetchQuoteUsecase: FetchQuoteUsecase!
    
    override func setUpWithError() throws {
        super.setUp()
        mockQuoteRepository = MockQuoteRepository()
        mockQuoteMapper = MockQuoteMapper()
        mockFetchQuoteUsecase = FetchQuoteUsecase(repository: mockQuoteRepository, quoteMapper: mockQuoteMapper)
    }
    
    override func tearDownWithError() throws {
        mockQuoteRepository = nil
        mockQuoteMapper = nil
        mockFetchQuoteUsecase = nil
        super.tearDown()
    }
    
    // MARK: - Valid Data
    func testFetchQuotes_ValidData_ReturnsMappedMovies() async throws {
        let mockQuoteData = [
            QuoteData(id: "2", dialog: "I'll be back.", movie: "Terminator", character: "Terminator", docID: "2")
        ]
        let mockResponse = GetQuotesResponse(docs: mockQuoteData, total: 1, limit: 1, offset: 0, page: 1, pages: 1, error: nil)
        mockQuoteRepository.getQuotesResponse = mockResponse
        
        let result = try await mockFetchQuoteUsecase.execute()
        
        // Then: Assert that mapping works correctly
        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.id, "2")
        XCTAssertEqual(result.first?.dialog, "I'll be back.")
        XCTAssertEqual(result.first?.movieId, "Terminator")
        XCTAssertEqual(result.first?.characterId, "Terminator")
    }
    
    // MARK: - Empty Data
    func testFetchQuotes_EmptyData_ReturnsEmptyArray() async throws {
        let mockResponse = GetQuotesResponse(docs: [], total: 1, limit: 1, offset: 0, page: 1, pages: 1, error: nil)
        mockQuoteRepository.getQuotesResponse = mockResponse
        
        let result = try await mockFetchQuoteUsecase.execute()
        
        XCTAssertTrue(result.isEmpty)
    }
    
    // MARK: - Repository Fetch Failure (Throws Error)
    func testFetchQuotes_FetchFailure_ThrowsError() async throws {
        mockQuoteRepository.getQuotesResponse = nil
        
        do {
            _ = try await mockFetchQuoteUsecase.execute()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual((error as NSError).code, 1001)
            XCTAssertEqual((error as NSError).domain, "MobileDevelopmentChallengeError")
        }
    }
    
    // MARK: - Empty QuoteData
    func testFetchQuotes_EmptyMovies() async throws {
        let errData = ErrorData(name: "error", message: "errorMsg", header: "")
        let mockResponse = GetQuotesResponse(docs: nil, total: 1, limit: 1, offset: 0, page: 1, pages: 1, error: errData)
        mockQuoteRepository.getQuotesResponse = mockResponse
        mockQuoteMapper.quotes = []
        
        do {
            _ = try await mockFetchQuoteUsecase.execute()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertEqual((error as! NetworkingError).userFriendlyMessage, NetworkingError.otherError(error: errData.message ?? "").userFriendlyMessage)
        }
    }
}



class MockQuoteRepository: QuoteRepositoryProtocol{
    var getQuotesResponse: GetQuotesResponse?
    
    func fetchQuotes() async throws -> MobileDevelopmentChallenge.GetQuotesResponse? {
        guard let response = getQuotesResponse else {
            throw NSError(domain: "MobileDevelopmentChallengeError", code: 1001, userInfo: [NSLocalizedDescriptionKey: "No response data found"])
        }
        
        return response
    }
}

class MockQuoteMapper: QuoteMapperProtocol {
    var quotes: [QuoteDto]?

    func toQuoteDTO(quote: MobileDevelopmentChallenge.QuoteData) -> MobileDevelopmentChallenge.QuoteDto {
        return QuoteDto(quote: quote)
    }
    
    func toQuotesDTO(quotes: [MobileDevelopmentChallenge.QuoteData]) -> [MobileDevelopmentChallenge.QuoteDto] {
        return quotes.map { quote in
            return QuoteDto(quote: quote)
        }
    }
}
