//
//  GetPaginatedCharactersForMovieUsecase.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

protocol GetPaginatedCharactersForMovieUsecaseProtocol {
    func execute(forMovieId movieId: String, page: Int, pageSize: Int) async throws -> [CharacterDTO]
}

class GetPaginatedCharactersForMovieUsecase: GetPaginatedCharactersForMovieUsecaseProtocol {
    
    private let getCharactersForMovieUsecase: GetCharactersForMovieUsecaseProtocol
    private var cachedFilteredCharacters: [CharacterDTO] = []
    
    init(getCharactersForMovieUsecase: GetCharactersForMovieUsecaseProtocol) {
        self.getCharactersForMovieUsecase = getCharactersForMovieUsecase
    }
    
    private func loadFilteredCharacters(forMovieId movieId: String) async throws {
        if cachedFilteredCharacters.isEmpty {
            cachedFilteredCharacters = try await getCharactersForMovieUsecase.execute(forMovieId: movieId)
        }
    }
    
    func execute(forMovieId movieId: String, page: Int, pageSize: Int) async throws -> [CharacterDTO] {
        try await loadFilteredCharacters(forMovieId: movieId)
        let startIndex = page * pageSize
        let endIndex = min(startIndex + pageSize, cachedFilteredCharacters.count)
        guard startIndex < cachedFilteredCharacters.count else {
            return []
        }
        return Array(cachedFilteredCharacters[startIndex..<endIndex])
    }
}
