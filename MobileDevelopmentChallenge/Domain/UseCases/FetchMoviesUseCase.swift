//
//  FetchMoviesUsecase.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol FetchMoviesUsecaseProtocol {
    func execute() async throws -> [MovieDTO]
}

class FetchMoviesUsecase: FetchMoviesUsecaseProtocol {
    private let repository: MovieRepositoryProtocol
    private let movieMapper: MovieMapperProtocol

    init(repository: MovieRepositoryProtocol,movieMapper: MovieMapperProtocol) {
        self.repository = repository
        self.movieMapper = movieMapper
    }

    func execute() async throws -> [MovieDTO] {
        let response =  try await repository.fetchMovies()
        if let movies = response?.docs{
            return movieMapper.toMoviesDTO(movies: movies)
        }else if let errMsg = response?.error?.message{
            throw(NetworkingError.otherError(error: errMsg))
        }else{
            throw(NetworkingError.otherError(error: ""))
        }
    }
}
