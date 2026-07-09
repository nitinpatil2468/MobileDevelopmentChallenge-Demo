//
//  LocalQuoteDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

class LocalQuoteDataSource: QuoteDataSource {
    
    private let jsonLoader: JSONLoaderProtocol
    private let configuration: ConfigurationProtocol
    
    public init(jsonLoader: JSONLoaderProtocol, configuration: ConfigurationProtocol) {
        self.jsonLoader = jsonLoader
        self.configuration = configuration
    }
    
    func fetchQuotes() async throws -> GetQuotesResponse? {
        let filename = configuration.localQuoteFileName
        guard let data = jsonLoader.loadJSON(filename: filename) else {
            throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to load local data"])
        }
        
        do {
            let getQuotesResponse = try JSONDecoder().decode(GetQuotesResponse.self, from: data)
            return getQuotesResponse
        } catch {
            throw error
        }
    }
}
