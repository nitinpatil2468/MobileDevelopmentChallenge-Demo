//
//  QuoteDataSource.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol QuoteDataSource {
    func fetchQuotes() async throws -> GetQuotesResponse?
}
