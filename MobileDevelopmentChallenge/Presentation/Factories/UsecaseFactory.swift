//
//  UsecaseFactory.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

class UsecaseFactory {
    private let repositoryFactory: RepositoryFactory
    
    init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
    }
    
    // Factory method to create the FetchMoviesUsecase
    func createFetchMoviesUsecase() -> FetchMoviesUsecase {
        let movieRepository = repositoryFactory.createMovieRepository()
        let movieMapper = MovieMapper()
        return FetchMoviesUsecase(
            repository: movieRepository,
            movieMapper: movieMapper
        )
    }
    
    // Factory method to create the FetchCharactersUsecase
    func createFetchCharactersUsecase() -> FetchCharactersUsecase {
        let characterRepository = repositoryFactory.createCharacterRepository()
        let characterMapper = CharacterMapper()
        return FetchCharactersUsecase(
            repository: characterRepository,
            characterMapper: characterMapper
        )
    }
    
    // Factory method to create the FetchQuoteUsecase
    func createFetchQuoteUsecase() -> FetchQuoteUsecase {
        let quoteRepository = repositoryFactory.createQuoteRepository()
        let quoteMapper = QuoteMapper()
        return FetchQuoteUsecase(
            repository: quoteRepository,
            quoteMapper: quoteMapper
        )
    }
    
    // Factory method to create GetCharactersForMovieUsecase
    func createGetCharactersForMovieUsecase() -> GetCharactersForMovieUsecase {
        let fetchQuoteUsecase = createFetchQuoteUsecase()
        let fetchCharactersUsecase = createFetchCharactersUsecase()
        return GetCharactersForMovieUsecase(
            fetchQuotesUsecase: fetchQuoteUsecase,
            fetchCharactersUsecase: fetchCharactersUsecase
        )
    }
    
    // Factory method to create GetPaginatedCharactersForMovieUsecase
    func createGetPaginatedCharactersForMovieUsecase() -> GetPaginatedCharactersForMovieUsecase {
        let getCharactersForMovieUsecase = createGetCharactersForMovieUsecase()
        return GetPaginatedCharactersForMovieUsecase(
            getCharactersForMovieUsecase: getCharactersForMovieUsecase
        )
    }
    
    // Factory method to create GetQuotesForCharacterUsecase
    func createGetQuotesForCharacterUsecase() -> GetQuotesForCharacterUsecase {
        let fetchQuoteUsecase = createFetchQuoteUsecase()
        return GetQuotesForCharacterUsecase(
            fetchQuotesUsecase: fetchQuoteUsecase
        )
    }
}
