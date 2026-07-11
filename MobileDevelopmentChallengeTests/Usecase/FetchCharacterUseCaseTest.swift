////
////  FetchCharacterUseCaseTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 28/01/25.
////
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//final class FetchCharacterUseCaseTest: XCTestCase {
//    
//    var mockCharacterRepository: MockCharacterRepository!
//    var mockCharacterMapper: MockCharacterMapper!
//    var mockFetchCharactersUsecase: FetchCharactersUsecase!
//    
//    override func setUpWithError() throws {
//        super.setUp()
//        mockCharacterRepository = MockCharacterRepository()
//        mockCharacterMapper = MockCharacterMapper()
//        mockFetchCharactersUsecase = FetchCharactersUsecase(repository: mockCharacterRepository, characterMapper: mockCharacterMapper)
//    }
//
//    override func tearDownWithError() throws {
//        mockCharacterRepository = nil
//        mockCharacterMapper = nil
//        mockFetchCharactersUsecase = nil
//        super.tearDown()
//    }
//    
//    // MARK: - ESuccessful fetch of characters
//        func testFetchCharactersSuccess() async throws {
//            let mockCharacterData = [
//                MobileDevelopmentChallenge.CharacterData(id: "1", name: "Test Character", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//            ]
//            let mockResponse = MobileDevelopmentChallenge.GetCharactersResponse(docs: mockCharacterData, total: 1, limit: 1, offset: 1, page: 1, pages: 1, error: nil)
//            
//            mockCharacterRepository.getCharactersResponse = mockResponse
//            
//            let result = try await mockFetchCharactersUsecase.execute()
//            
//            XCTAssertEqual(result.count, 1)
//            XCTAssertEqual(result.first?.id, "1")
//            XCTAssertEqual(result.first?.name, "Test Character")
//            XCTAssertEqual(result.first?.gender, "Male")
//        }
//
//    // MARK: - Error scenario when repository returns an error
//        func testFetchCharactersFailure() async throws {
//            mockCharacterRepository.getCharactersResponse = nil
//            do {
//                _ = try await mockFetchCharactersUsecase.execute()
//                XCTFail("Expected error to be thrown")
//            } catch {
//                XCTAssertEqual((error as NSError).code, 1001)
//                XCTAssertEqual((error as NSError).domain, "MobileDevelopmentChallengeError")
//            }
//        }
//
//    // MARK: -  Empty response from repository
//        func testFetchCharactersEmptyResponse() async throws {
//            let mockResponse = MobileDevelopmentChallenge.GetCharactersResponse(docs: [], total: 1, limit: 1, offset: 1, page: 1, pages: 1, error: nil)
//            mockCharacterRepository.getCharactersResponse = mockResponse
//            
//            let result = try await mockFetchCharactersUsecase.execute()
//            
//            XCTAssertTrue(result.isEmpty)
//        }
//        
//    // MARK: - Mapping of character data (if you need to test mapping logic)
//        func testCharacterMapping() async throws {
//            let mockCharacterData = [
//                MobileDevelopmentChallenge.CharacterData(id: "2", name: "Mapped Character", wikiURL: nil, race: nil, birth: nil, gender: "Female", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//            ]
//            let mockResponse = MobileDevelopmentChallenge.GetCharactersResponse(docs: mockCharacterData, total: 1, limit: 1, offset: 1, page: 1, pages: 1, error: nil)
//            mockCharacterRepository.getCharactersResponse = mockResponse
//            mockCharacterMapper.characters = [CharacterDTO(character: mockCharacterData.last!)]
//            
//            let result = try await mockFetchCharactersUsecase.execute()
//            
//            XCTAssertEqual(result.count, 1)
//            XCTAssertEqual(result.first?.id, "2")
//            XCTAssertEqual(result.first?.name, "Mapped Character")
//            XCTAssertEqual(result.first?.gender, "Female")
//        }
//    
//    // MARK: - Empty Characterdata from response
//        func testfetchCharacters_EmptyMovies() async throws {
//            let errData = ErrorData(name: "error", message: "errorMsg", header: "")
//            let mockResponse = MobileDevelopmentChallenge.GetCharactersResponse(docs: nil, total: 1, limit: 1, offset: 1, page: 1, pages: 1, error: errData)
//            mockCharacterRepository.getCharactersResponse = mockResponse
//            mockCharacterMapper.characters = []
//            
//            do {
//                _ = try await mockFetchCharactersUsecase.execute()
//                XCTFail("Expected error to be thrown")
//            } catch {
//                XCTAssertEqual((error as! NetworkingError).userFriendlyMessage, NetworkingError.otherError(error: errData.message ?? "").userFriendlyMessage)
//            }
//        }
//}
//
//
//class MockCharacterRepository: CharacterRepositoryProtocol{
//    var getCharactersResponse: GetCharactersResponse?
//    
//    func fetchCharacters() async throws -> MobileDevelopmentChallenge.GetCharactersResponse? {
//        guard let response = getCharactersResponse else {
//            throw NSError(domain: "MobileDevelopmentChallengeError", code: 1001, userInfo: [NSLocalizedDescriptionKey: "No response data found"])
//        }
//        return response
//    }
//}
//
//class MockCharacterMapper: CharacterMapperProtocol {
//    var characters: [CharacterDTO]?
//
//    func toCharacterDTO(character: MobileDevelopmentChallenge.CharacterData) -> MobileDevelopmentChallenge.CharacterDTO {
//        return CharacterDTO(character: character)
//    }
//    
//    func toCharactersDTO(characters: [MobileDevelopmentChallenge.CharacterData]) -> [MobileDevelopmentChallenge.CharacterDTO] {
//        return characters.map { character in
//            return CharacterDTO(character: character)
//        }
//    }
//}
