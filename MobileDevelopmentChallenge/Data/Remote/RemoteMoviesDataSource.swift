//
//  RemoteMoviesDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class RemoteMoviesDataSource: MovieDataSource{
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchMovies() async throws -> GetMovieResponse?{
        do {
            let getMovieResponse: GetMovieResponse = try await apiClient.request(url: APIEndPoint.fetchMovies.path, method: .get)
            return getMovieResponse
        } catch {
            throw error
        }
    }
}
