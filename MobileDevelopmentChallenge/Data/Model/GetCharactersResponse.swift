//
//  GetCharactersResponse.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

// MARK: - GetCharactersResponse
struct GetCharactersResponse: Codable {
    let docs: [CharacterData]?
    let total, limit, offset, page: Int?
    let pages: Int?
    let error: ErrorData?
    let git: Int?
}

// MARK: - CharacterData
struct CharacterData: Codable {
    let id, name: String?
    let wikiURL: String?
    let race: String?
    let birth: String?
    let gender: String?
    let death, hair, height: String?
    let realm: String?
    let spouse: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case wikiURL = "wikiUrl"
        case race, birth, gender, death, hair, height, realm, spouse
    }
}

// MARK: - ErrorData
struct ErrorData: Codable {
    let name, message, header: String?
}
