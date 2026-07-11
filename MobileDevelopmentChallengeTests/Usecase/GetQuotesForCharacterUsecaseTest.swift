////
////  GetQuotesForCharacterUsecaseTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 28/01/25.
////
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//
//class GetQuotesForCharacterUsecaseTest: XCTestCase {
//    
//    var getQuotesForCharacterUsecase: GetQuotesForCharacterUsecase!
//    
//    var mockQuoteRepository: MockQuoteRepository!
//    var mockQuoteMapper: MockQuoteMapper!
//    var mockFetchQuoteUsecase: FetchQuoteUsecase!
//    
//    override func setUp() {
//        super.setUp()
//        mockQuoteRepository = MockQuoteRepository()
//        mockQuoteMapper = MockQuoteMapper()
//        mockFetchQuoteUsecase = FetchQuoteUsecase(repository: mockQuoteRepository, quoteMapper: mockQuoteMapper)
//        
//        getQuotesForCharacterUsecase = GetQuotesForCharacterUsecase(
//            fetchQuotesUsecase: mockFetchQuoteUsecase
//        )
//    }
//    
//    override func tearDown() {
//        mockQuoteRepository = nil
//        mockQuoteMapper = nil
//        mockFetchQuoteUsecase = nil
//        super.tearDown()
//    }
//    
//    // MARK: - No quotes available
//    func testExecute_noQuotes() async {
//        mockQuoteRepository.getQuotesResponse = nil
//        
//        do {
//            let result = try await getQuotesForCharacterUsecase.execute(characterId: "character_1")
//            XCTAssert(result.isEmpty, "Expected no quotes, but got \(result.count) quotes.")
//        } catch {
//            XCTAssertNotNil(error)
//        }
//    }
//    
//    // MARK: - No quotes for the specified character
//    func testExecute_noQuotesForCharacter() async {
//        let mockQuoteData = [
//            QuoteData(id: "100", dialog: "I'll be back.", movie: "movie_123", character: "character_2", docID: "2")
//        ]
//        let mockQuoteResponse = GetQuotesResponse(docs: mockQuoteData, total: 1, limit: 1, offset: 0, page: 1, pages: 1, error: nil)
//        mockQuoteRepository.getQuotesResponse = mockQuoteResponse
//        
//        do {
//            let result = try await getQuotesForCharacterUsecase.execute(characterId: "character_1")
//            XCTAssert(result.isEmpty, "Expected no quotes, but got \(result.count) quotes.")
//        } catch {
//            XCTAssertNotNil(error)
//        }
//    }
//    
//    // MARK: - Valid quotes for the specified character
//    func testExecute_QuotesForCharacter() async {
//        let mockQuoteData = [
//            QuoteData(id: "100", dialog: "I'll be back.", movie: "movie_123", character: "character_1", docID: "2")
//        ]
//        let mockQuoteResponse = GetQuotesResponse(docs: mockQuoteData, total: 1, limit: 1, offset: 0, page: 1, pages: 1, error: nil)
//        mockQuoteRepository.getQuotesResponse = mockQuoteResponse
//        
//        do {
//            let result = try await getQuotesForCharacterUsecase.execute(characterId: "character_1")
//            XCTAssertEqual(result.count, 1, "Expected 2 characters for the movie.")
//            XCTAssert(result.contains { $0.characterId == "character_1" }, "Expected Test Character in the result.")
//        } catch {
//            XCTAssertNotNil(error)
//        }
//    }
//    
//}
