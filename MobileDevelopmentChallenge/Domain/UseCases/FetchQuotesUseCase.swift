//
//  FetchQuotesUsecase.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol FetchQuotesUsecaseProtocol {
    func execute() async throws -> [QuoteDto]
}

class FetchQuoteUsecase: FetchQuotesUsecaseProtocol {
    private let repository: QuoteRepositoryProtocol
    private let quoteMapper: QuoteMapperProtocol

    init(repository: QuoteRepositoryProtocol,quoteMapper: QuoteMapperProtocol) {
        self.repository = repository
        self.quoteMapper = quoteMapper
    }

    func execute() async throws -> [QuoteDto] {
        let response =  try await repository.fetchQuotes()
        if let quotes = response?.docs{
            return quoteMapper.toQuotesDTO(quotes: quotes)
        }else if let errMsg = response?.error?.message{
            throw(NetworkingError.otherError(error: errMsg))
        }else{
            throw(NetworkingError.otherError(error: ""))
        }
    }
}
