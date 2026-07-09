//
//  CharacterRepositoryImpl.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class CharacterRepositoryImpl: CharacterRepositoryProtocol {
    private let characterDataSource: CharacterDataSource
    
    init(dataSource: CharacterDataSource) {
        self.characterDataSource = dataSource
    }
    
    func fetchCharacters() async throws -> GetCharactersResponse? {
        return try await characterDataSource.fetchCharacters()
    }
}

