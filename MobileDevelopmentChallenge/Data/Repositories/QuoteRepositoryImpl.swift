//
//  QuoteRepositoryImpl.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

class QuoteRepositoryImpl: QuoteRepositoryProtocol {
    private let quoteDataSource: QuoteDataSource

    init(dataSource: QuoteDataSource) {
        self.quoteDataSource = dataSource
    }

    func fetchQuotes() async throws -> GetQuotesResponse? {
        return try await quoteDataSource.fetchQuotes()
    }
}

