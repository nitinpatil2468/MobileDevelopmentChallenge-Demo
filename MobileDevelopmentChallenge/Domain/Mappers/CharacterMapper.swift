//
//  CharacterMapper.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol CharacterMapperProtocol {
    func toCharacterDTO(character: CharacterData) -> CharacterDTO
    func toCharactersDTO(characters: [CharacterData]) -> [CharacterDTO]
}

class CharacterMapper: CharacterMapperProtocol {
    func toCharacterDTO(character: CharacterData) -> CharacterDTO{
        return CharacterDTO(character: character)
    }
    
    func toCharactersDTO(characters: [CharacterData]) -> [CharacterDTO] {
        return characters.map { character in
            return CharacterDTO(character: character)
        }
    }
}
