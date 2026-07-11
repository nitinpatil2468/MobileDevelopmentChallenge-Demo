////
////  GetCharactersForMovieUsecaseTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 28/01/25.
////
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//class GetCharactersForMovieUsecaseTests: XCTestCase {
//    
//    var getCharactersForMovieUsecase: GetCharactersForMovieUsecase!
//    
//    var mockFetchCharactersUsecase: FetchCharactersUsecase!
//    var mockCharacterRepository: MockCharacterRepository!
//    var mockCharacterMapper: MockCharacterMapper!
//    
//    var mockQuoteRepository: MockQuoteRepository!
//    var mockQuoteMapper: MockQuoteMapper!
//    var mockFetchQuoteUsecase: FetchQuoteUsecase!
//
//    override func setUp() {
//        super.setUp()
//        
//        mockCharacterRepository = MockCharacterRepository()
//        mockCharacterMapper = MockCharacterMapper()
//        mockFetchCharactersUsecase = FetchCharactersUsecase(repository: mockCharacterRepository, characterMapper: mockCharacterMapper)
//        
//        mockQuoteRepository = MockQuoteRepository()
//        mockQuoteMapper = MockQuoteMapper()
//        mockFetchQuoteUsecase = FetchQuoteUsecase(repository: mockQuoteRepository, quoteMapper: mockQuoteMapper)
//
//        getCharactersForMovieUsecase = GetCharactersForMovieUsecase(
//            fetchQuotesUsecase: mockFetchQuoteUsecase,
//            fetchCharactersUsecase: mockFetchCharactersUsecase
//        )
//    }
//    
//    override func tearDown() {
//        mockCharacterRepository = nil
//        mockCharacterMapper = nil
//        mockFetchCharactersUsecase = nil
//        mockQuoteRepository = nil
//        mockQuoteMapper = nil
//        mockFetchQuoteUsecase = nil
//        getCharactersForMovieUsecase = nil
//        super.tearDown()
//    }
//    
//    // MARK: - No Character for Movie
//    func testExecute_noCharactersForMovie() async {
//        
//        let mockQuoteData = [
//            QuoteData(id: "100", dialog: "I'll be back.", movie: "movie_123", character: "200", docID: "2")
//        ]
//        let mockQuoteResponse = GetQuotesResponse(docs: mockQuoteData, total: 1, limit: 1, offset: 0, page: 1, pages: 1, error: nil)
//        mockQuoteRepository.getQuotesResponse = mockQuoteResponse
//
//        
//        let mockCharacterData = [
//            MobileDevelopmentChallenge.CharacterData(id: "300", name: "Test Character", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        ]
//        let mockCharResponse = MobileDevelopmentChallenge.GetCharactersResponse(docs: mockCharacterData, total: 1, limit: 1, offset: 1, page: 1, pages: 1,error: nil)
//        mockCharacterRepository.getCharactersResponse = mockCharResponse
//                
//        do {
//            let result = try await getCharactersForMovieUsecase.execute(forMovieId: "movie_123")
//            XCTAssert(result.isEmpty, "Expected empty result when there are no quotes for the movie.")
//        } catch {
//            XCTFail("Expected successful execution, but got an error: \(error)")
//        }
//    }
//    
//    // MARK: - Valid Character for Movie
//    func testExecute_successfulCharacterRetrieval() async {
//        let mockQuoteData = [
//            QuoteData(id: "100", dialog: "I'll be back.", movie: "movie_123", character: "200", docID: "2")
//        ]
//        let mockQuoteResponse = GetQuotesResponse(docs: mockQuoteData, total: 1, limit: 1, offset: 0, page: 1, pages: 1,error: nil)
//        mockQuoteRepository.getQuotesResponse = mockQuoteResponse
//        
//        
//        let mockCharacterData = [
//            MobileDevelopmentChallenge.CharacterData(id: "200", name: "Test Character", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        ]
//        let mockCharResponse = MobileDevelopmentChallenge.GetCharactersResponse(docs: mockCharacterData, total: 1, limit: 1, offset: 1, page: 1, pages: 1,error: nil)
//        mockCharacterRepository.getCharactersResponse = mockCharResponse
//        
//        do {
//            let result = try await getCharactersForMovieUsecase.execute(forMovieId: "movie_123")
//            XCTAssertEqual(result.count, 1, "Expected 2 characters for the movie.")
//            XCTAssert(result.contains { $0.id == "200" && $0.name == "Test Character" }, "Expected Test Character in the result.")
//        } catch {
//            XCTFail("Expected successful execution, but got an error: \(error)")
//        }
//    }
//    
//
//    
//    // MARK: - No Quotes for Movies
//    func testExecute_noQuotesForMovies() async {
//        mockQuoteRepository.getQuotesResponse = nil
//        
//        let mockCharacterData = [
//            MobileDevelopmentChallenge.CharacterData(id: "200", name: "Test Character", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        ]
//        let mockCharResponse = MobileDevelopmentChallenge.GetCharactersResponse(docs: mockCharacterData, total: 1, limit: 1, offset: 1, page: 1, pages: 1,error: nil)
//        mockCharacterRepository.getCharactersResponse = mockCharResponse
//        
//        do {
//            let result = try await getCharactersForMovieUsecase.execute(forMovieId: "movie_123")
//            XCTAssert(result.isEmpty, "Expected empty result when there are no quotes for the movie.")
//
//        } catch {
//            XCTAssertNotNil(error)
//        }
//    }
//    
//    // MARK: - No Charcters for Movies
//    func testExecute_nilCharacterResponse() async {
//        let mockQuoteData = [
//            QuoteData(id: "100", dialog: "I'll be back.", movie: "movie_123", character: "200", docID: "2")
//        ]
//        let mockQuoteResponse = GetQuotesResponse(docs: mockQuoteData, total: 1, limit: 1, offset: 0, page: 1, pages: 1,error: nil)
//        mockQuoteRepository.getQuotesResponse = mockQuoteResponse
//       
//        mockCharacterRepository.getCharactersResponse = nil
//        
//        do {
//            let result = try await getCharactersForMovieUsecase.execute(forMovieId: "movie_123")
//            XCTAssert(result.isEmpty, "Expected empty result when there are no quotes for the movie.")
//        } catch {
//            XCTAssertNotNil(error)
//        }
//    }
//}
//
//
//class MockFetchQuoteUsecase: FetchQuotesUsecaseProtocol {
//    var quotesToReturn: [QuoteDto] = []
//    
//    func execute() async throws -> [QuoteDto] {
//        return quotesToReturn
//    }
//}
//
//class MockFetchCharactersUsecase: FetchCharactersUsecaseProtocol {
//    var charactersToReturn: [CharacterDTO] = []
//    
//    func execute() async throws -> [CharacterDTO] {
//        return charactersToReturn
//    }
//}
