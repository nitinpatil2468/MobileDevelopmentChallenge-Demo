//
//  LocalMoviesDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

class LocalMoviesDataSource: MovieDataSource {
    
    private let jsonLoader: JSONLoaderProtocol
    private let configuration: ConfigurationProtocol
    
    public init(jsonLoader: JSONLoaderProtocol, configuration: ConfigurationProtocol) {
        self.jsonLoader = jsonLoader
        self.configuration = configuration
    }
    
    func fetchMovies() async throws -> GetMovieResponse? {
        let filename = configuration.localMovieFileName
        guard let data = jsonLoader.loadJSON(filename: filename) else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to load local data"])
        }
        
        do {
            let getMovieResponse = try JSONDecoder().decode(GetMovieResponse.self, from: data)
            return getMovieResponse
        } catch {
            throw error
        }
    }
}
