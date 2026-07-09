//
//  MovieRepositoryImpl.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class MovieRepositoryImpl: MovieRepositoryProtocol {
    private let movieDataSource: MovieDataSource
    
    init(dataSource: MovieDataSource) {
        self.movieDataSource = dataSource
    }
    
    func fetchMovies() async throws -> GetMovieResponse? {
        return try await movieDataSource.fetchMovies()
    }
}

