//
//  RemoteCharactersDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class RemoteCharactersDataSource: CharacterDataSource{
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchCharacters() async throws -> GetCharactersResponse? {
        do {
            let getCharactersResponse: GetCharactersResponse = try await apiClient.request(url: APIEndPoint.fetchCharacters.path, method: .get)
            return getCharactersResponse
        } catch {
            throw error
        }
    }
}
