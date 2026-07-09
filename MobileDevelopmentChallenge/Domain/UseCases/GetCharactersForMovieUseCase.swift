//
//  GetCharactersForMovieUsecase.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol GetCharactersForMovieUsecaseProtocol {
    func execute(forMovieId movieId: String) async throws -> [CharacterDTO]
}

class GetCharactersForMovieUsecase: GetCharactersForMovieUsecaseProtocol {
    
    private let fetchQuotesUsecase: FetchQuoteUsecase
    private let fetchCharactersUsecase: FetchCharactersUsecase
    
    init(fetchQuotesUsecase: FetchQuoteUsecase, fetchCharactersUsecase: FetchCharactersUsecase) {
        self.fetchQuotesUsecase = fetchQuotesUsecase
        self.fetchCharactersUsecase = fetchCharactersUsecase
    }
    
    func execute(forMovieId movieId: String) async throws -> [CharacterDTO] {
        let quotes = try await fetchQuotesUsecase.execute()
        let filteredQuotes = quotes.filter { $0.movieId == movieId }
        let characters = try await fetchCharactersUsecase.execute()
        let characterIds = Set(filteredQuotes.map { $0.characterId })
        let filteredCharacters = characters.filter { characterIds.contains($0.id) }
        return filteredCharacters
    }
}
