//
//  MovieDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol MovieDataSource {
    func fetchMovies() async throws -> GetMovieResponse?
}



