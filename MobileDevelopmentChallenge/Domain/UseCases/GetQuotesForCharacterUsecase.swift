//
//  GetQuotesForCharacterUsecase.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 28/01/25.
//

import Foundation

protocol GetQuotesForCharacterUsecaseProtocol {
    func execute(characterId: String) async throws -> [QuoteDto]
}

class GetQuotesForCharacterUsecase: GetQuotesForCharacterUsecaseProtocol {
    
    private let fetchQuotesUsecase: FetchQuoteUsecase
    
    init(fetchQuotesUsecase: FetchQuoteUsecase) {
        self.fetchQuotesUsecase = fetchQuotesUsecase
    }
    
    func execute(characterId: String) async throws -> [QuoteDto] {
        
        let quotes = try await fetchQuotesUsecase.execute()
        let filteredQuotes = quotes.filter { $0.characterId == characterId }
        return filteredQuotes
        
    }
    
}
