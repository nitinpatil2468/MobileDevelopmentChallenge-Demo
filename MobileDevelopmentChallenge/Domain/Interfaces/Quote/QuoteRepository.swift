//
//  QuoteRepository.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

protocol QuoteRepositoryProtocol {
    func fetchQuotes() async throws -> GetQuotesResponse?
}
