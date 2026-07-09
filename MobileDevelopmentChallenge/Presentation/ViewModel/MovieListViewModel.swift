//
//  MovieListViewModel.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol MovieListViewModelProtocol{
    func fetchMovies() async
}

class MovieListViewModel: ObservableObject,MovieListViewModelProtocol {
    private let fetchMoviesUsecase: FetchMoviesUsecase
    @Published var movies: [MovieDTO] = []
    @Published var errorMessage: String = ""
    @Published var showErrorAlert = false
    @Published var isLoading = false
    
    init(fetchMoviesUsecase: FetchMoviesUsecase) {
        self.fetchMoviesUsecase = fetchMoviesUsecase
    }
    
    @MainActor
    func fetchMovies(){
        Task{
            do {
                isLoading = true
                let movieDTOs = try await fetchMoviesUsecase.execute()
                self.movies = movieDTOs
                isLoading = false
            } catch {
                if let error = error as? NetworkingError{
                    isLoading = false
                    showError(err: error.userFriendlyMessage)
                }
            }
        }
    }
    
    @MainActor
    func showError(err:String){
        errorMessage = err
        showErrorAlert.toggle()
    }
    
}


