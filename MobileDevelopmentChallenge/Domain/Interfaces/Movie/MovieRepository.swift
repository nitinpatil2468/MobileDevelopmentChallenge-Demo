//
//  MovieRepository.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol MovieRepositoryProtocol {
    func fetchMovies() async throws -> GetMovieResponse?
}
