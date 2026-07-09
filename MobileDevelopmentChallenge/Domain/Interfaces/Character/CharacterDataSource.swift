//
//  CharacterDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol CharacterDataSource {
   func fetchCharacters() async throws -> GetCharactersResponse?
}
