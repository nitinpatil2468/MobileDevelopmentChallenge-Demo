//
//  CharacterRepository.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol CharacterRepositoryProtocol {
    func fetchCharacters() async throws -> GetCharactersResponse?
}
