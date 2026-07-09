//
//  ViewModelFactory.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

// ViewModel Factory
class ViewModelFactory {
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    // Factory method to create the CharacterListViewModel
    func createCharacterListViewModel() -> CharacterListViewModel {
        let repositoryFactory = RepositoryFactory(apiClient: apiClient)
        let useCaseFactory = UsecaseFactory(repositoryFactory: repositoryFactory)
        
        let getPaginatedCharactersForMovieUsecase = useCaseFactory.createGetPaginatedCharactersForMovieUsecase()
        
        return CharacterListViewModel(
            getPaginatedCharactersForMovieUsecase: getPaginatedCharactersForMovieUsecase
        )
    }
    
    // Factory method to create the QuoteListViewModel
    func createQuoteListViewModel() -> QuoteListViewModel {
        let repositoryFactory = RepositoryFactory(apiClient: apiClient)
        let useCaseFactory = UsecaseFactory(repositoryFactory: repositoryFactory)
        
        let getQuotesForCharacterUsecase = useCaseFactory.createGetQuotesForCharacterUsecase()
        
        return QuoteListViewModel(
            getQuotesForCharacterUsecase: getQuotesForCharacterUsecase
        )
    }
    
    // Factory method to create the MovieListViewModel
    func createMovieListViewModel() -> MovieListViewModel {
        let repositoryFactory = RepositoryFactory(apiClient: apiClient)
        let useCaseFactory = UsecaseFactory(repositoryFactory: repositoryFactory)
        let fetchMoviesUsecase = useCaseFactory.createFetchMoviesUsecase()
        return MovieListViewModel(fetchMoviesUsecase: fetchMoviesUsecase)
    }
}

