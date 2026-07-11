////
////  FetchMoviesUsecaseTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 28/01/25.
////
//
//import Foundation
//
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//final class FetchMoviesUsecaseTest: XCTestCase {
//    
//    var mockMovieRepo: MockMovieRepo!
//    var mockMovieMapper: MockMovieMapper!
//    var mockFetchMoviesUsecase: FetchMoviesUsecase!
//    
//    override func setUpWithError() throws {
//        super.setUp()
//        mockMovieRepo = MockMovieRepo()
//        mockMovieMapper = MockMovieMapper()
//        mockFetchMoviesUsecase = FetchMoviesUsecase(repository: mockMovieRepo, movieMapper: mockMovieMapper)
//    }
//
//    override func tearDownWithError() throws {
//        mockMovieRepo = nil
//        mockMovieMapper = nil
//        mockFetchMoviesUsecase = nil
//        super.tearDown()
//    }
//    
//    // MARK: - Valid Data
//        func testFetchMovies_ValidData_ReturnsMappedMovies() async throws {
//            let movieData = [MovieData(id: "1", name: "Inception", runtimeInMinutes: 148, budgetInMillions: 160, boxOfficeRevenueInMillions: 836.8, academyAwardNominations: 8, academyAwardWINS: 4, rottenTomatoesScore: 86.0)]
//            let getMovieResponse = GetMovieResponse(docs: movieData, total: 1, limit: 10, offset: 0, page: 1, pages: 1, error: nil)
//            
//            mockMovieRepo.getMovieResponse = getMovieResponse
//            mockMovieMapper.movies = [MovieDTO(movie: movieData[0])]
//            
//            let result = try await mockFetchMoviesUsecase.execute()
//            
//            XCTAssertNotNil(result)
//            XCTAssertEqual(result.count, 1)
//            XCTAssertEqual(result.first?.name, "Inception")
//            XCTAssertEqual(result.first?.rating, "86")
//        }
//    
//    // MARK: - Empty Data
//        func testFetchMovies_EmptyData_ReturnsEmptyArray() async throws {
//            let getMovieResponse = GetMovieResponse(docs: [], total: 0, limit: 10, offset: 0, page: 1, pages: 0, error: nil)
//            
//            mockMovieRepo.getMovieResponse = getMovieResponse
//            mockMovieMapper.movies = []
//            
//            let result = try await mockFetchMoviesUsecase.execute()
//            
//            XCTAssertTrue(result.isEmpty)
//        }
//    
//    // MARK: - Repository Fetch Failure (Throws Error)
//        func testFetchMovies_FetchFailure_ThrowsError() async throws {
//            mockMovieRepo.getMovieResponse = nil
//            do {
//                let _ = try await mockFetchMoviesUsecase.execute()
//                XCTFail("Expected an error to be thrown, but function succeeded.")
//                
//            } catch {
//                XCTAssertNotNil(error)
//            }
//        }
//    
//    // MARK: - Empty MovieData
//        func testFetchMovies_EmptyMovies() async throws {
//            let errData = ErrorData(name: "error", message: "errorMsg", header: "")
//            let getMovieResponse = GetMovieResponse(docs: nil, total: 0, limit: 10, offset: 0, page: 1, pages: 0, error: errData)
//            
//            mockMovieRepo.getMovieResponse = getMovieResponse
//            mockMovieMapper.movies = []
//            
//            do {
//                _ = try await mockFetchMoviesUsecase.execute()
//                XCTFail("Expected error to be thrown")
//            } catch {
//                XCTAssertEqual((error as! NetworkingError).userFriendlyMessage, NetworkingError.otherError(error: errData.message ?? "").userFriendlyMessage)
//            }
//        }
//}
//
//
//
//class MockMovieRepo: MovieRepositoryProtocol{
//    var getMovieResponse: GetMovieResponse?
//    
//    func fetchMovies() async throws -> MobileDevelopmentChallenge.GetMovieResponse? {
//        guard let response = getMovieResponse else {
//            throw NSError(domain: "MobileDevelopmentChallengeError", code: 1001, userInfo: [NSLocalizedDescriptionKey: "No response data found"])
//        }
//        return response
//    }
//}
//
//class MockMovieMapper: MovieMapperProtocol {
//    var movies: [MovieDTO]?
//    
//    func toMovieDTO(movie: MobileDevelopmentChallenge.MovieData) -> MobileDevelopmentChallenge.MovieDTO {
//        return MovieDTO(movie: movie)
//    }
//    
//    func toMoviesDTO(movies: [MobileDevelopmentChallenge.MovieData]) -> [MobileDevelopmentChallenge.MovieDTO] {
//        return movies.map { movie in
//            return MovieDTO(movie: movie)
//        }
//    }
//}
