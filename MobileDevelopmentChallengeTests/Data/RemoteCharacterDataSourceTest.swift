////
////  RemoteCharacterDataSourceTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 29/01/25.
////
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//
//class RemoteCharactersDataSourceTests: XCTestCase {
//    
//    var dataSource: RemoteCharactersDataSource!
//    var mockAPIClient: MockAPIClient!
//    
//    override func setUp() {
//        super.setUp()
//        mockAPIClient = MockAPIClient()
//        dataSource = RemoteCharactersDataSource(apiClient: mockAPIClient)
//    }
//    
//    override func tearDown() {
//        dataSource = nil
//        mockAPIClient = nil
//        super.tearDown()
//    }
//    
//    // Test case for successful character fetch
//    func test_FetchCharacters_Success() async {
//        let mockCharacterData = [
//            MobileDevelopmentChallenge.CharacterData(id: "1", name: "Test Character", wikiURL: nil, race: nil, birth: nil, gender: "Male", death: nil, hair: nil, height: nil, realm: nil, spouse: nil)
//        ]
//        let expectedResponse = MobileDevelopmentChallenge.GetCharactersResponse(docs: mockCharacterData, total: 1, limit: 1, offset: 1, page: 1, pages: 1, error: nil)
//        mockAPIClient.result = .success(expectedResponse)
//        
//        do {
//            let response = try await dataSource.fetchCharacters()
//            XCTAssertNotNil(response)
//            XCTAssertEqual(response?.docs?.count, 1)
//            XCTAssertEqual(response?.docs?.first?.name, "Test Character")
//        } catch {
//            XCTFail("Expected success, but got error: \(error)")
//        }
//    }
//    
//    // Test case for failed character fetch (e.g., network failure)
//    func testFetchCharactersFailure() async {
//        mockAPIClient.result = .failure(NetworkingError.otherError(error: ""))
//        
//        do {
//            let _ = try await dataSource.fetchCharacters()
//            XCTFail("Expected failure, but got a successful response.")
//        } catch let error as NetworkingError {
//            XCTAssertEqual(error.userFriendlyMessage, NetworkingError.otherError(error: "").userFriendlyMessage)
//        } catch {
//            XCTFail("Expected NetworkingError, but got a different error: \(error)")
//        }
//    }
//}
//
//// Generic Mock for APIClientProtocol
//class MockAPIClient: APIClientProtocol {
//    var result: Result<Any, Error>?
//    func request<T: Decodable>(url: String, method: HTTPMethod) async throws -> T {
//        if let result = result {
//            switch result {
//            case .success(let response):
//                guard let response = response as? T else {
//                    throw NetworkingError.otherError(error: "")
//                }
//                return response
//            case .failure(let error):
//                throw error
//            }
//        }
//        throw NetworkingError.otherError(error: "")
//    }
//}
