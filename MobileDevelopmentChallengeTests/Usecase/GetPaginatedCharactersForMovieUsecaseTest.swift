////
////  GetPaginatedCharactersForMovieUsecaseTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 28/01/25.
////
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//class GetPaginatedCharactersForMovieUsecaseTests: XCTestCase {
//    
//    var mockGetCharactersForMovieUsecase: MockGetCharactersForMovieUsecase!
//    var usecase: GetPaginatedCharactersForMovieUsecase!
//    
//    override func setUp() {
//        super.setUp()
//        mockGetCharactersForMovieUsecase = MockGetCharactersForMovieUsecase()
//        usecase = GetPaginatedCharactersForMovieUsecase(getCharactersForMovieUsecase: mockGetCharactersForMovieUsecase)
//    }
//    
//    override func tearDown() {
//        usecase = nil
//        mockGetCharactersForMovieUsecase = nil
//        super.tearDown()
//    }
//    
//    // Test Case 1: Test for successful pagination with data
//    func testExecute_withPaginatedCharacters_returnsCorrectPage() async {
//
//        let character1 =
//            MobileDevelopmentChallenge.CharacterData(id: "1", name: "Test Character", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        mockGetCharactersForMovieUsecase.characters = [CharacterDTO(character: character1)]
//        
//        do {
//            let result = try await usecase.execute(forMovieId: "movie-123", page: 0, pageSize: 1)
//            
//            XCTAssertEqual(result.count, 1)
//            XCTAssertEqual(result.last?.name, "Test Character")
//        } catch {
//            XCTFail("Expected success, but got error: \(error)")
//        }
//    }
//    
////    // Test Case 2: Test for successful pagination with data and middle page
//    func testExecute_withPaginatedCharacters_returnsMiddlePage() async {
//
//        let character1 =
//            MobileDevelopmentChallenge.CharacterData(id: "1", name: "Test Character1", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        let character2 =
//            MobileDevelopmentChallenge.CharacterData(id: "2", name: "Test Character2", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        let character3 =
//            MobileDevelopmentChallenge.CharacterData(id: "3", name: "Test Character3", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        let character4 =
//            MobileDevelopmentChallenge.CharacterData(id: "4", name: "Test Character4", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        mockGetCharactersForMovieUsecase.characters = [CharacterDTO(character: character1),CharacterDTO(character: character2),CharacterDTO(character: character3),CharacterDTO(character: character4)]
//        
//        do {
//            let result = try await usecase.execute(forMovieId: "movie-123", page: 1, pageSize: 2)
//            
//            XCTAssertEqual(result.count, 2)
//            XCTAssertEqual(result[0].name, "Test Character3")
//            XCTAssertEqual(result[1].name, "Test Character4")
//        } catch {
//            XCTFail("Expected success, but got error: \(error)")
//        }
//    }
//    
//    // Test Case 3: Test for pagination when no characters are available (empty list)
//    func testExecute_withNoCharacters_returnsEmptyList() async {
//        mockGetCharactersForMovieUsecase.characters = []
//
//        do {
//            let result = try await usecase.execute(forMovieId: "movie-123", page: 0, pageSize: 2)
//            XCTAssertTrue(result.isEmpty)
//        } catch {
//            XCTFail("Expected empty list, but got error: \(error)")
//        }
//    }
//
//  // Test Case 4: Test for pagination when out-of-bounds (page exceeds available data)
//    func testExecute_withOutOfBoundsPage_returnsEmptyList() async {
//        let character1 =
//            MobileDevelopmentChallenge.CharacterData(id: "1", name: "Test Character1", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        let character2 =
//            MobileDevelopmentChallenge.CharacterData(id: "2", name: "Test Character2", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        let character3 =
//            MobileDevelopmentChallenge.CharacterData(id: "3", name: "Test Character3", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        let character4 =
//            MobileDevelopmentChallenge.CharacterData(id: "4", name: "Test Character4", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        mockGetCharactersForMovieUsecase.characters = [CharacterDTO(character: character1),CharacterDTO(character: character2),CharacterDTO(character: character3),CharacterDTO(character: character4)]
//        
//        
//        do {
//            let result = try await usecase.execute(forMovieId: "movie-123", page: 3, pageSize: 2)
//            XCTAssertTrue(result.isEmpty)
//        } catch {
//            XCTFail("Expected empty list, but got error: \(error)")
//        }
//    }
//}
//
//
//
//class MockGetCharactersForMovieUsecase: GetCharactersForMovieUsecaseProtocol{
//    var characters: [CharacterDTO] = []
//    var error: NetworkingError?
//    
//    func execute(forMovieId movieId: String) async throws -> [MobileDevelopmentChallenge.CharacterDTO] {
//        return characters
//    }
//}
