//
//  LocalCharacterDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

class LocalCharacterDataSource: CharacterDataSource {
    private let jsonLoader: JSONLoaderProtocol
    private let configuration: ConfigurationProtocol
    
    public init(jsonLoader: JSONLoaderProtocol, configuration: ConfigurationProtocol) {
        self.jsonLoader = jsonLoader
        self.configuration = configuration
    }
    
    func fetchCharacters() async throws -> GetCharactersResponse? {
        let filename = configuration.localCharacterFileName
        guard let data = jsonLoader.loadJSON(filename: filename) else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to load local data"])
        }
        
        do {
            let getCharacterResponse = try JSONDecoder().decode(GetCharactersResponse.self, from: data)
            return getCharacterResponse
        } catch {
            throw error
        }
    }
}
