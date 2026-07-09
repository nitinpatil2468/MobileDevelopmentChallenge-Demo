//
//  GetQuotesResponse.swift
//  MobileDevelopmentChallenge
//
//  Created by capgemini on 27/01/25.
//

import Foundation

// MARK: - GetQuotesResponse
struct GetQuotesResponse: Codable {
    let docs: [QuoteData]?
    let total, limit, offset, page: Int?
    let pages: Int?
    let error: ErrorData?
}

// MARK: - QuoteData
struct QuoteData: Codable {
    let id, dialog: String?
    let movie: String?
    let character, docID: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case dialog, movie, character
        case docID = "id"
    }
}
