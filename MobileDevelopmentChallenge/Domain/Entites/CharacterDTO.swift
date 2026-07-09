//
//  CharacterDTO.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

struct CharacterDTO: Identifiable,Equatable {
    let id: String
    let name: String
    let gender: String
    
    init(character: CharacterData) {
        self.id = character.id ?? ""
        self.name = character.name ?? ""
        self.gender = character.gender ?? ""
    }
}
