//
//  QuoteMapper.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol QuoteMapperProtocol {
    func toQuoteDTO(quote: QuoteData) -> QuoteDto
    func toQuotesDTO(quotes: [QuoteData]) -> [QuoteDto]
}

class QuoteMapper: QuoteMapperProtocol {
    func toQuoteDTO(quote: QuoteData) -> QuoteDto{
        return QuoteDto(quote: quote)
    }
    
    func toQuotesDTO(quotes: [QuoteData]) -> [QuoteDto]{
        return quotes.map { quote in
            return QuoteDto(quote: quote)
        }
    }
}
