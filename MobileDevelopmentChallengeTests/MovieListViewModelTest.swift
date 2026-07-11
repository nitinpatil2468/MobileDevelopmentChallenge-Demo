////
////  MovieListViewModelTest.swift
////  MobileDevelopmentChallengeTests
////
////  Created by capgemini on 28/01/25.
////
//
//import XCTest
//@testable import MobileDevelopmentChallenge
//
//class MovieListViewModelTests: XCTestCase {
//    
//    var viewModel: MockMovieListViewModel!
//   
//    override func setUpWithError() throws {
//        super.setUp()
//        viewModel = MockMovieListViewModel()
//    }
//
//    override func tearDownWithError() throws {
//        viewModel = nil
//        super.tearDown()
//    }
//    
//    // MARK: - FetchMovies Success
//  func test_FetchMovies_Success() async {
//        let movieData = MovieData(id: "1", name: "Inception", runtimeInMinutes: 148, budgetInMillions: 160, boxOfficeRevenueInMillions: 836.8, academyAwardNominations: 8, academyAwardWINS: 4, rottenTomatoesScore: 86.0)
//        let result = [MovieDTO(movie: movieData)]
//        viewModel.movies = result
//        viewModel.showErrorAlert = false
//        viewModel.errorMessage = ""
//     
//        await viewModel.fetchMovies()
//        
//        XCTAssertEqual(viewModel.movies.count, 1)
//        XCTAssertEqual(viewModel.errorMessage, "")
//        XCTAssertFalse(viewModel.showErrorAlert)
//    }
//    
//    // MARK: - FetchMovies Failure
//    func test_FetchMovies_Failure() async {
//        viewModel.movies = []
//        viewModel.showErrorAlert = true
//        viewModel.errorMessage = NetworkingError.otherError(error: "").userFriendlyMessage
//        
//        await viewModel.fetchMovies()
//        
//        XCTAssertTrue(viewModel.showErrorAlert)
//        XCTAssertEqual(viewModel.errorMessage, NetworkingError.otherError(error: "").userFriendlyMessage)
//        XCTAssertTrue(viewModel.movies.isEmpty)
//    }
//}
//
//
//
//class MockMovieListViewModel: MovieListViewModelProtocol {
//    var movies: [MovieDTO] = []
//    var errorMessage: String = ""
//    var showErrorAlert = false
//    
//    func fetchMovies() async {
//        if movies.isEmpty{
//            showErrorAlert = true
//        }else{
//            errorMessage = ""
//            showErrorAlert = false
//        }
//    }
//}
