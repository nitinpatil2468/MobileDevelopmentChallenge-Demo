//
//  RepositoryFactory.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

class RepositoryFactory {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    // Factory method to create the MovieRepository
        func createMovieRepository() -> MovieRepositoryImpl {
            let remoteCharDataSource = RemoteMoviesDataSource(apiClient: apiClient)
            return MovieRepositoryImpl(dataSource: remoteCharDataSource)
        }
    
    // Factory method to create the CharacterRepository
    func createCharacterRepository() -> CharacterRepositoryImpl {
        let remoteCharDataSource = RemoteCharactersDataSource(apiClient: apiClient)
        return CharacterRepositoryImpl(dataSource: remoteCharDataSource)
    }
    
    // Factory method to create the QuoteRepository
    func createQuoteRepository() -> QuoteRepositoryImpl {
        let remoteQuoteDataSource = RemoteQuotesDataSource(apiClient: apiClient)
        return QuoteRepositoryImpl(dataSource: remoteQuoteDataSource)
    }
}
