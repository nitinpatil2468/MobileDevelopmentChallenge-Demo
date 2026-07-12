////
////  MovieMapperTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 28/01/25.
////
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//class MovieMapperTest: XCTestCase {
//    
//    var movieMapper: MovieMapper!
//    
//    override func setUp() {
//        super.setUp()
//        movieMapper = MovieMapper()
//    }
//    
//    override func tearDown() {
//        movieMapper = nil
//        super.tearDown()
//    }
//    
//    func testToMovieDTO() {
//        let movieData = MovieData(id: "1", name: "Inception", runtimeInMinutes: 148, budgetInMillions: 160, boxOfficeRevenueInMillions: 836.8, academyAwardNominations: 8, academyAwardWINS: 4, rottenTomatoesScore: 86.0)
//        let expectedDTO = MovieDTO(movie: movieData)
//        let resultDTO = movieMapper.toMovieDTO(movie: movieData)
//        
//        XCTAssertEqual(resultDTO, expectedDTO)
//    }
//    
//    func testToMoviesDTO() {
//        let movieData1 = MovieData(id: "1", name: "Inception", runtimeInMinutes: 148, budgetInMillions: 160, boxOfficeRevenueInMillions: 836.8, academyAwardNominations: 8, academyAwardWINS: 4, rottenTomatoesScore: 86.0)
//        let movieData2 = MovieData(id: "2", name: "Inception 3", runtimeInMinutes: 148, budgetInMillions: 160, boxOfficeRevenueInMillions: 836.8, academyAwardNominations: 8, academyAwardWINS: 4, rottenTomatoesScore: 86.0)
//
//        let moviesData = [movieData1, movieData2]
//        let expectedDTO1 = MovieDTO(movie: movieData1)
//        let expectedDTO2 = MovieDTO(movie: movieData2)
//        
//        let resultDTOs = movieMapper.toMoviesDTO(movies: moviesData)
//        
//        XCTAssertEqual(resultDTOs.count, 2)
//        XCTAssertEqual(resultDTOs[0], expectedDTO1)
//        XCTAssertEqual(resultDTOs[1], expectedDTO2)
//    }
//    
//    func testToMoviesDTO_EmptyArray() {
//        let moviesData: [MovieData]  = []
//
//        let resultDTOs = movieMapper.toMoviesDTO(movies: moviesData)
//        
//        XCTAssertEqual(resultDTOs.count, 0)
//    }
//}
//
