//
//  RemoteQuotesDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class RemoteQuotesDataSource: QuoteDataSource{
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchQuotes() async throws -> GetQuotesResponse? {
        do {
            let getQuotesResponse: GetQuotesResponse = try await apiClient.request(url: APIEndPoint.fetchQuotes.path, method: .get)
            return getQuotesResponse
        } catch {
            throw error
        }
    }
}
