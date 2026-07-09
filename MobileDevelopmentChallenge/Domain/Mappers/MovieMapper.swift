//
//  MovieMapper.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol MovieMapperProtocol {
    func toMovieDTO(movie: MovieData) -> MovieDTO
    func toMoviesDTO(movies: [MovieData]) -> [MovieDTO]
}

class MovieMapper: MovieMapperProtocol {
    func toMovieDTO(movie: MovieData) -> MovieDTO{
        return MovieDTO(movie: movie)
    }
    
    func toMoviesDTO(movies: [MovieData]) -> [MovieDTO] {
        return movies.map { movie in
            return MovieDTO(movie: movie)
        }
    }
}
