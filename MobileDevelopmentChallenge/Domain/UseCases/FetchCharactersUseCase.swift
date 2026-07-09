//
//  FetchCharactersUsecase.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol FetchCharactersUsecaseProtocol {
    func execute() async throws -> [CharacterDTO]
}

class FetchCharactersUsecase: FetchCharactersUsecaseProtocol {
    private let repository: CharacterRepositoryProtocol
    private let characterMapper: CharacterMapperProtocol

    init(repository: CharacterRepositoryProtocol,characterMapper: CharacterMapperProtocol) {
        self.repository = repository
        self.characterMapper = characterMapper
    }

    func execute() async throws -> [CharacterDTO] {
        let response =  try await repository.fetchCharacters()
        if let characters = response?.docs{
            return characterMapper.toCharactersDTO(characters: characters)
        }else if let errMsg = response?.error?.message{
            throw(NetworkingError.otherError(error: errMsg))
        }else{
            throw(NetworkingError.otherError(error: ""))
        }
    }
}
